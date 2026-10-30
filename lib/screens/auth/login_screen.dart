import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi_app_1/core/helpers/custom_app_button.dart';
import 'package:depi_app_1/core/helpers/custom_app_field.dart';
import 'package:depi_app_1/cubits/auth_cubit.dart';
import 'package:depi_app_1/cubits/auth_state.dart';
import 'package:depi_app_1/screens/auth/register_screen.dart';
import 'package:depi_app_1/screens/store/main_shell.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyle(color: Color(0xffff5e00)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffff5e00)),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainShell()),
              );
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(backgroundColor: Colors.red, content: Text(state.msg)),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();
            return SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/images/sing_in.png', height: 200),
                  const SizedBox(height: 40),
                  const Text(
                    'Enter Your Email and\nPassword to access your account',
                    style: TextStyle(fontSize: 22, color: Color(0xff6d3805)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  CustomAppField(
                    hint: 'Email',
                    controller: cubit.emailLoginControl,
                  ),
                  const SizedBox(height: 20),
                  CustomAppField(
                    hint: 'Password',
                    suffixIcon: const Icon(Icons.visibility_off),
                    isobscure: true,
                    controller: cubit.passwordLoginControl,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (cubit.emailLoginControl.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter your email first'),
                          ),
                        );
                        return;
                      }
                      try {
                        await cubit.resetPassword();
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password reset email sent'),
                          ),
                        );
                      } on FirebaseAuthException catch (error) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.message ?? 'Try again later'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomAppButton(
                    text: 'Sign In',
                    isLoading: state is LoginLoading,
                    onPressed: () {
                      if (cubit.emailLoginControl.text.trim().isEmpty ||
                          cubit.passwordLoginControl.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Enter email and password'),
                          ),
                        );
                        return;
                      }
                      cubit.signIn();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
