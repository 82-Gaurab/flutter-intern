import 'package:flutter/material.dart';
import 'package:my_app/core/widget/common/bottom_navigation_bar.dart';

class ThirdOnboardingScreen extends StatelessWidget {
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
                "assets/delivery-icon.png",
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              Text("Get Fastest Delivery", style: TextStyle(fontSize: 20)),
              SizedBox(height: 2),
              Text(
                "Fastest operation to provide food by fence.",
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
                      MaterialPageRoute(builder: (_) => NavigationBarScreen()),
                    );
                  },
                  child: Text(
                    "Get Started",
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
