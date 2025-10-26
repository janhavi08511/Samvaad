import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_routes.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

bool _isLoading = false;

void _handleLogin() async {
final userName = _nameController.text.trim();
if (userName.isEmpty) {
ScaffoldMessenger.of(context)
.showSnackBar(const SnackBar(content: Text("Please enter your name")));
return;
}

setState(() => _isLoading = true);

await Future.delayed(const Duration(seconds: 1)); // Simulate login delay

setState(() => _isLoading = false);

Navigator.pushNamed(
  context,
  AppRoutes.mainWrapper,
  arguments: userName,
);


}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AppColors.background,
body: SafeArea(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
"Welcome Back 👋",
style: TextStyle(
color: AppColors.darkText,
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
const Text(
"Login to continue your journey.",
style: TextStyle(color: AppColors.greyText, fontSize: 16),
),
const SizedBox(height: 40),
          // Name Field
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Name"),
          ),
          const SizedBox(height: 16),

          // Email Field
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          const SizedBox(height: 16),

          // Password Field
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: "Password"),
          ),
          const SizedBox(height: 32),

          // Login Button
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text("Log In"),
                ),

          const SizedBox(height: 16),

          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.createAccountScreen);
              },
              child: const Text(
                "Don't have an account? Create one",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);


}
}
