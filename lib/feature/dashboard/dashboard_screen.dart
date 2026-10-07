import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("Dashboard", style: TextStyle(fontSize: 23))),
      ),
    );
  }
}
