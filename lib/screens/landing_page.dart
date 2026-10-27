import 'package:flutter/material.dart';

/// Habitly colors, taken from the design.
class HabitlyColors {
  static const background = Color(0xFFF3E7D3); // warm cream
  static const terracotta = Color(0xFFC8713D); // brand orange
  static const ink = Color(0xFF2B1D14); // dark brown text
  static const muted = Color(0xFF7A6A5A); // tagline text
  static const outline = Color(0xFFD9C7AE); // button border
  static const buttonFill = Color(0xFFF7EEDF); // Google button fill
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo circle with "H"
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      color: HabitlyColors.terracotta,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'H',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // App name
                  const Text(
                    'Habitly',
                    style: TextStyle(
                      fontFamily: 'serif',
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: HabitlyColors.ink,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Tagline
                  const Text(
                    'Small steps, done daily.',
                    style: TextStyle(fontSize: 14, color: HabitlyColors.muted),
                  ),
                  const SizedBox(height: 48),

                  // Continue with Google
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: add Google sign-in
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: HabitlyColors.buttonFill,
                        foregroundColor: HabitlyColors.ink,
                        side: const BorderSide(color: HabitlyColors.outline),
                        shape: const StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              color: HabitlyColors.ink,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'G',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Create an account
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: () {
                        // TODO: go to the Registration page
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: HabitlyColors.terracotta,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
