import 'package:flutter/material.dart';
import 'package:my_app/core/di/dependency_injector.dart';
import 'package:my_app/core/services/storage/user_session_service.dart';
import 'package:my_app/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:my_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:my_app/feature/profile/presentation/screens/update_profile_screen.dart';
import 'package:my_app/feature/profile/presentation/widget/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Future<void> logout() async {
      final authCubit = getIt<AuthCubit>();

      await authCubit.singOut();

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      }
    }

    final userData = getIt<UserSessionService>();
    final username = userData.getUsername();
    final userEmail = userData.getEmail();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 90,
                backgroundColor: Colors.amber,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 85,
                  child: Icon(
                    Icons.person_rounded,
                    size: 60,
                    color: Colors.amber,
                  ),
                ),
              ),

              SizedBox(height: 15),

              Column(
                children: [Text(username ?? "null"), Text(userEmail ?? "null")],
              ),

              ProfileItem(
                title: "Update Profile",
                icon: Icons.remove_red_eye,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => UpdateProfileScreen()),
                  );
                },
              ),

              SizedBox(height: 20),
              ProfileItem(
                backgroundColor: const Color.fromARGB(255, 244, 105, 105),
                textColor: Colors.white,
                title: "Sign Out",
                icon: Icons.logout_outlined,
                onTap: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
