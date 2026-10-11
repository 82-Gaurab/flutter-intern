import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/core/services/storage/user_session_service.dart';
import 'package:my_app/core/widget/common/bottom_navigation_bar.dart';
import 'package:my_app/feature/onboarding/onboarding_screens.dart';

class SplashScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigate() {
    final _session = GetIt.instance<UserSessionService>();

    final isLoggedIn = _session.isLoggedIn();

    if (isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => NavigationBarScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => OnboardingScreens()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), _navigate);
  }

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

              // SizedBox(height: 55),

              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.8,
              //   height: 45,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Color(0xAAff7622),
              //     ),
              //     onPressed: _navigate,
              //     child: Text(
              //       "Next",
              //       style: TextStyle(color: Colors.white, fontSize: 16),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
