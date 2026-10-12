import 'package:flutter/material.dart';
import 'package:my_app/core/di/dependency_injector.dart';
import 'package:my_app/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:my_app/feature/profile/presentation/screens/profile_screen.dart';

class UpdateProfileScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> update() async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    final authCubit = getIt<AuthCubit>();

    // Validate empty fields.
    if (email.isEmpty && password.isEmpty && username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in any field to update.')),
      );
      return;
    }

    await authCubit.updateCredentials(username, email, password);

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProfileScreen()),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "User name",
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                SizedBox(height: 15),

                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.key_sharp),
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: update,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4D00),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: const Color(0xFFFF4D00),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
