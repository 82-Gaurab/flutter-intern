import 'package:flutter/material.dart';
import 'package:my_app/feature/onboarding/third_onboarding_screen.dart';

class SecondOnboardingScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Onboarding Screen 2"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ThirdOnboardingScreen()),
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
