import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi_app_1/cubits/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final fireAuth = FirebaseAuth.instance;

  final emailRegisterControl = TextEditingController();
  final passwordRegisterControl = TextEditingController();
  final confirmPasswordRegisterControl = TextEditingController();

  final emailLoginControl = TextEditingController();
  final passwordLoginControl = TextEditingController();

  Future<void> signUp() async {
    emit(RegisterLoading());

    try {
      await fireAuth.createUserWithEmailAndPassword(
        email: emailRegisterControl.text.trim(),
        password: passwordRegisterControl.text.trim(),
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure('The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(RegisterFailure('The email address is badly formatted.'));
      } else {
        emit(RegisterFailure(e.message ?? 'An error occurred'));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  Future<void> signIn() async {
    emit(LoginLoading());

    try {
      await fireAuth.signInWithEmailAndPassword(
        email: emailLoginControl.text.trim(),
        password: passwordLoginControl.text.trim(),
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure('Wrong password provided.'));
      } else if (e.code == 'invalid-credential') {
        emit(LoginFailure('Invalid email or password.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginFailure('The email address is badly formatted.'));
      } else {
        emit(LoginFailure(e.message ?? 'An error occurred'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> resetPassword() async {
    await fireAuth.sendPasswordResetEmail(email: emailLoginControl.text.trim());
  }

  @override
  Future<void> close() {
    emailRegisterControl.dispose();
    passwordRegisterControl.dispose();
    confirmPasswordRegisterControl.dispose();
    emailLoginControl.dispose();
    passwordLoginControl.dispose();
    return super.close();
  }
}
