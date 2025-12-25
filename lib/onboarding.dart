import 'package:shared_preferences/shared_preferences.dart';
import 'package:etr_project/intro_screns/intro_page_1.dart';
import 'package:etr_project/intro_screns/intro_page_2.dart';
import 'package:etr_project/intro_screns/intro_page_3.dart';
import 'package:etr_project/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_complete', true);
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    }
  }

  final pageCtrl = PageController();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageCtrl.addListener(() {
      int newPage = pageCtrl.page?.round() ?? 0;
      if (newPage != currentPage) {
        setState(() {
          currentPage = newPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            PageView(
              controller: pageCtrl,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [IntroPage1(), IntroPage2(), IntroPage3()],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SmoothPageIndicator(
                      controller: pageCtrl,
                      count: 3,
                      effect: WormEffect(
                        dotColor: Colors.orange.shade100,
                        activeDotColor: Colors.orange.shade700,
                        dotHeight: 14,
                        dotWidth: 14,
                        spacing: 16,
                        paintStyle: PaintingStyle.fill,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade700,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.1,
                          ),
                          elevation: 2,
                        ),
                        onPressed: () {
                          if (currentPage < 2) {
                            pageCtrl.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            _completeOnboarding();
                          }
                        },
                        child: Text(currentPage == 2 ? 'GET STARTED' : 'NEXT'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
