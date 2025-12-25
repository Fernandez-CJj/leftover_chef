import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Container(
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.shade100.withOpacity(0.3),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  'assets/images/page-3.png',
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
              Text(
                'Save Your Favorites',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB35400),
                  fontSize: 26,
                  letterSpacing: 1.1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Text(
                'Easily mark and access your favorite recipes anytime. Build your personal cookbook as you explore!',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Divider(
                color: Colors.orange.shade100,
                thickness: 1.2,
                indent: 40,
                endIndent: 40,
              ),
              const SizedBox(height: 8),
              Text(
                'Tap Get Started and begin your journey!',
                style: TextStyle(
                  color: Colors.orange.shade700,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
