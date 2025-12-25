import 'package:etr_project/helpers/dbhelper.dart';
import 'package:etr_project/onboarding.dart';
import 'package:etr_project/screens/home_screen/home_screen.dart';
import 'package:etr_project/seed_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
  Dbhelper.openDb();
  Dbhelper.deleteAllRecipe();
  seedRecipes();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  Future<bool> _isOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_complete') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _isOnboardingComplete(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.data == true) {
            return HomeScreen();
          } else {
            return OnboardingScreen();
          }
        },
      ),
    );
  }
}

// Future<void> resetOnboarding() async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.remove('onboarding_complete');
// }
