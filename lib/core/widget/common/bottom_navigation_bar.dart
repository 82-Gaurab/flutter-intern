import 'package:flutter/material.dart';
import 'package:my_app/feature/dashboard/dashboard_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black54, size: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_sharp,
              color: Colors.black54,
              size: 25,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.black54, size: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person, color: Colors.black54, size: 25),
          ),
        ],
      ),
      body: DashboardScreen(),
    );
  }
}
