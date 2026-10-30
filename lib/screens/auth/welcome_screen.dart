import 'package:flutter/material.dart';
import 'package:depi_app_1/screens/auth/login_screen.dart';
import 'package:depi_app_1/screens/auth/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/welcome_screen.png', height: 330),
              const SizedBox(height: 30),
              const Text(
                'Welcome to our app',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Shop online and get groceries delivered from store to your home in fast and easy way.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown.shade400, height: 1.5),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.orange,
                  minimumSize: const Size.fromHeight(50),
                  side: const BorderSide(color: Colors.orange),
                ),
                child: const Text('Sign In'),
              ),
              const Spacer(),
              const Text(
                'Fresh groceries, simple shopping',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
