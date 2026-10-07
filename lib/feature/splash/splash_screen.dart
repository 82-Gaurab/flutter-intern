import 'package:flutter/material.dart';
import 'package:my_app/feature/onboarding/first_onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Logo.png",
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              SizedBox(height: 10),
              const Text(
                "Food Delivery Service",
                style: TextStyle(fontSize: 18),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FirstOnboardingScreen()),
                  );
                },
                child: Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
