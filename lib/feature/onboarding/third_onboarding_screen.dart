import 'package:flutter/material.dart';

class ThirdOnboardingScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Onboarding Screen 3"),
            ElevatedButton(onPressed: () {}, child: Text("Next")),
            ElevatedButton(onPressed: () {}, child: Text("Skip")),
          ],
        ),
      ),
    );
  }
}
