import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Hello", style: TextStyle(fontSize: 60))),
    );
  }
}
