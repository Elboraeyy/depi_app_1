import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi_app_1/core/helpers/custom_app_button.dart';
import 'package:depi_app_1/core/helpers/custom_app_field.dart';
import 'package:depi_app_1/cubits/auth_cubit.dart';
import 'package:depi_app_1/cubits/auth_state.dart';
import 'package:depi_app_1/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Color(0xffff5e00)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xffff5e00)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account created successfully')),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            }
            if (state is RegisterFailure) {
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
                  Image.asset('assets/images/sing_up.png', height: 220),
                  const SizedBox(height: 25),
                  const Text(
                    'Create an account\nto access all features',
                    style: TextStyle(fontSize: 22, color: Color(0xff6d3805)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  CustomAppField(
                    hint: 'Email',
                    controller: cubit.emailRegisterControl,
                  ),
                  const SizedBox(height: 20),
                  CustomAppField(
                    hint: 'Password',
                    suffixIcon: const Icon(Icons.visibility_off),
                    isobscure: true,
                    controller: cubit.passwordRegisterControl,
                  ),
                  const SizedBox(height: 20),
                  CustomAppField(
                    hint: 'Confirm Password',
                    suffixIcon: const Icon(Icons.visibility_off),
                    isobscure: true,
                    controller: cubit.confirmPasswordRegisterControl,
                  ),
                  const SizedBox(height: 30),
                  CustomAppButton(
                    text: 'Sign Up',
                    isLoading: state is RegisterLoading,
                    onPressed: () {
                      if (cubit.emailRegisterControl.text.trim().isEmpty ||
                          cubit.passwordRegisterControl.text.trim().isEmpty ||
                          cubit.confirmPasswordRegisterControl.text
                              .trim()
                              .isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Complete all fields')),
                        );
                        return;
                      }
                      if (cubit.passwordRegisterControl.text !=
                          cubit.confirmPasswordRegisterControl.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                          ),
                        );
                        return;
                      }
                      cubit.signUp();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'Sign In',
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
