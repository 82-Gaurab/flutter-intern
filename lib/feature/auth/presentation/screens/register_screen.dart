import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/di/dependency_injector.dart';
import 'package:my_app/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:my_app/feature/auth/presentation/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: RegisterView(),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  // Register user using the register use case.
  Future<void> register() async {
    final username = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    final authCubit = context.read<AuthCubit>();

    // Validate empty fields.
    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await authCubit.register(username, email, password);

    setState(() {
      isLoading = false;
    });

    if (mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    String? placeholder,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      height: 55,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: const TextStyle(
          color: Color(0xFF555555),
          fontSize: 12.5,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, size: 19, color: const Color(0xFF888888)),
          suffixIcon: suffixIcon,
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(color: Color(0xFFB5B5B5), fontSize: 10),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Color(0xFFE8E8E8), width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Color(0xFFFF4D00), width: 1.2),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              15,
              MediaQuery.of(context).size.height * 0.12,
              15,
              15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // LOGO
                Column(
                  children: [
                    Center(child: Image.asset('assets/Logo.png', height: 50)),
                    const SizedBox(height: 7),
                    const Text(
                      'Food Delivery Service',
                      style: TextStyle(color: Color(0xFFB9B9B9), fontSize: 14),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // TITLE
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Enter your name, email and password.',
                  style: TextStyle(color: Color(0xFFB8B8B8), fontSize: 11.5),
                ),

                const SizedBox(height: 25),

                // NAME
                buildTextField(
                  controller: nameController,
                  placeholder: 'Dweyne Johnson',
                  label: 'Name',
                  icon: Icons.person_outline_rounded,
                ),

                const SizedBox(height: 14),

                // EMAIL
                buildTextField(
                  controller: emailController,
                  label: 'Email',
                  placeholder: 'dweynejohnson@gmail.com',
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 14),

                // PASSWORD
                buildTextField(
                  controller: passwordController,
                  placeholder: '********',
                  label: 'Password',
                  icon: Icons.lock_outline_rounded,
                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFFB8B8B8),
                      size: 19,
                    ),
                  ),
                ),

                const SizedBox(height: 31),

                // REGISTER BUTTON
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4D00),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: const Color(0xFFFF4D00),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 24),

                // LOGIN NAVIGATION
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 13,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Color(0xFFFF4D00),
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
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
