import 'package:flutter/material.dart';
import 'package:my_app/feature/onboarding/onboarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

              SizedBox(height: 55),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xAAff7622),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => OnboardingScreens()),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
