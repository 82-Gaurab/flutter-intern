import 'package:flutter/material.dart';
import 'package:my_app/feature/dashboard/dashboard_screen.dart';
import 'package:my_app/feature/onboarding/third_onboarding_screen.dart';

class SecondOnboardingScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/burger-image.png",
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              Text("Pick The Food", style: TextStyle(fontSize: 20)),
              SizedBox(height: 2),
              Text(
                "Get all the food in one place.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
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
                      MaterialPageRoute(
                        builder: (_) => ThirdOnboardingScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DashboardScreen()),
                    );
                  },
                  child: Text("Skip", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
