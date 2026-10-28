import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'landing_page.dart'; // for HabitlyColors

/// One task in the app. Sample data for now — saving comes later.
class Task {
  final String title;
  final String tag;
  final String dueLabel;
  final int daysLeft;
  final String priority;
  final bool inProgress;

  const Task({
    required this.title,
    required this.tag,
    required this.dueLabel,
    required this.daysLeft,
    required this.priority,
    this.inProgress = false,
  });
}

const sampleTasks = [
  Task(
    title: 'Repot the monstera',
    tag: 'Home',
    dueLabel: 'Tomorrow',
    daysLeft: 1,
    priority: 'High',
    inProgress: true,
  ),
  Task(
    title: 'Call mom for her birthday',
    tag: 'Personal',
    dueLabel: 'Tomorrow',
    daysLeft: 1,
    priority: 'Medium',
  ),
  Task(
    title: 'Finish client logo concepts',
    tag: 'Work',
    dueLabel: 'In 2 days',
    daysLeft: 2,
    priority: 'High',
    inProgress: true,
  ),
  Task(
    title: 'Submit quarterly tax docs',
    tag: 'Admin',
    dueLabel: 'In 3 days',
    daysLeft: 3,
    priority: 'Medium',
    inProgress: true,
  ),
];

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  static const _cardColor = Color(0xFFE9DCC6);
  static const _tileColor = Color(0xFFFAF4EA);

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  String get _today {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final now = DateTime.now();
    return '${days[now.weekday - 1]}, ${months[now.month - 1]} ${now.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _tabIndex == 0
            ? _buildHome()
            : const Center(
                child: Text(
                  'Coming soon',
                  style: TextStyle(fontSize: 16, color: HabitlyColors.muted),
                ),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        onTap: (index) => setState(() => _tabIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: HabitlyColors.background,
        selectedItemColor: HabitlyColors.terracotta,
        unselectedItemColor: HabitlyColors.muted,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Widget'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildHome() {
    final almostDue = sampleTasks
        .where((t) => t.daysLeft <= 1)
        .take(2)
        .toList();
    final highest = sampleTasks
        .where((t) => t.priority == 'High')
        .take(2)
        .toList();
    final inProgress = sampleTasks.where((t) => t.inProgress).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      children: [
        // Greeting + add button
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$_greeting, ${widget.username}',
                    style: GoogleFonts.fraunces(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: HabitlyColors.ink,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _today,
                    style: const TextStyle(
                      fontSize: 13,
                      color: HabitlyColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            IconButton.filled(
              onPressed: () {
                // TODO: open the New task page
              },
              icon: const Icon(Icons.add),
              tooltip: 'New task',
              style: IconButton.styleFrom(
                backgroundColor: HabitlyColors.terracotta,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Almost due
        _sectionTitle('Almost due'),
        Row(
          children: [
            for (final task in almostDue) ...[
              Expanded(child: _dueCard(task)),
              if (task != almostDue.last) const SizedBox(width: 12),
            ],
          ],
        ),
        const SizedBox(height: 24),

        // Highest priority
        _sectionTitle('Highest priority'),
        Row(
          children: [
            for (final task in highest) ...[
              Expanded(child: _priorityCard(task)),
              if (task != highest.last) const SizedBox(width: 12),
            ],
          ],
        ),
        const SizedBox(height: 24),

        // Work in progress
        _sectionTitle('Work in progress'),
        for (final task in inProgress) _progressTile(task),
      ],
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.fraunces(
          fontSize: 13,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
          color: HabitlyColors.ink,
        ),
      ),
    );
  }

  Widget _smallLabel(String text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        fontSize: 11,
        letterSpacing: 0.8,
        color: HabitlyColors.muted,
      ),
    );
  }

  Widget _cardTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.fraunces(
        fontSize: 17,
        fontWeight: FontWeight.w800,
        height: 1.2,
        color: HabitlyColors.ink,
      ),
    );
  }

  Widget _dueCard(Task task) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _smallLabel(task.dueLabel),
          const SizedBox(height: 8),
          Expanded(child: _cardTitle(task.title)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _tileColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              task.priority,
              style: const TextStyle(fontSize: 12, color: HabitlyColors.ink),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priorityCard(Task task) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _smallLabel(task.tag),
          const SizedBox(height: 8),
          Expanded(child: _cardTitle(task.title)),
          Text(
            task.dueLabel,
            style: const TextStyle(fontSize: 12, color: HabitlyColors.muted),
          ),
        ],
      ),
    );
  }

  Widget _progressTile(Task task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _tileColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: HabitlyColors.terracotta,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: HabitlyColors.ink,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${task.tag} · ${task.dueLabel}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: HabitlyColors.muted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
