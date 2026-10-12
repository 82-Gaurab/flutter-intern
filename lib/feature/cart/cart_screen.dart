import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("Cart Screen"))),
    );
  }
}
