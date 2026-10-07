import 'package:flutter/material.dart';
import 'package:my_app/feature/onboarding/second_onboarding_screen.dart';

class FirstOnboardingScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Onboarding Screen 1"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SecondOnboardingScreen()),
                );
              },
              child: Text("Next"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Skip")),
          ],
        ),
      ),
    );
  }
}
