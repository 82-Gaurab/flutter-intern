import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/core/di/dependency_injector.dart';
import 'package:my_app/feature/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();

  try {
    talker.info("Initializing application...");

    await Firebase.initializeApp();
    talker.info("Firebase initialized");

    final sharedPref = await SharedPreferences.getInstance();
    talker.info("Shared Preferences initialized");

    await GoogleSignIn.instance.initialize();
    talker.info("Google signin initialized");

    await setUpDependencies(preferences: sharedPref, talker: talker);
    talker.info("Dependencies initialized");

    runApp(const MyApp());
  } catch (e, stackTrace) {
    talker.handle(e, stackTrace, "Application Initialization failed");
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const SplashScreen(),
    );
  }
}
