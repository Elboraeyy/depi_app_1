import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi_app_1/cubits/auth_cubit.dart';
import 'package:depi_app_1/firebase_options.dart';
import 'package:depi_app_1/screens/store/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Store Retail',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffff5e00)),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(centerTitle: true),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
