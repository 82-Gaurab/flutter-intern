import 'package:flutter/material.dart';
import 'package:my_app/feature/cart/cart_screen.dart';
import 'package:my_app/feature/dashboard/dashboard_screen.dart';
import 'package:my_app/feature/notifications/notification_screen.dart';
import 'package:my_app/feature/profile/presentation/screens/profile_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectedIndx = 0;
  List<Widget> lstScreens = [
    const DashboardScreen(),
    const NotificationScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndx,
        onTap: (value) => setState(() {
          selectedIndx = value;
        }),
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
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: Colors.black54, size: 25),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person, color: Colors.black54, size: 25),
          ),
        ],
      ),
      body: lstScreens[selectedIndx],
    );
  }
}
