import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_tracker/models/user.dart';
import 'package:expense_tracker/resources/app_colours.dart';
import 'package:expense_tracker/resources/app_routes.dart';
import 'package:expense_tracker/resources/app_strings.dart';
import 'package:expense_tracker/views/auth/forgot_password.dart';
import 'package:expense_tracker/views/auth/forgot_password_sent.dart';
import 'package:expense_tracker/views/auth/login.dart';
import 'package:expense_tracker/views/auth/reset_password.dart';
import 'package:expense_tracker/views/auth/setup_pin.dart';
import 'package:expense_tracker/views/auth/signup.dart';
import 'package:expense_tracker/views/auth/verification.dart';
import 'package:expense_tracker/views/home.dart';
import 'package:expense_tracker/views/onboarding/splash.dart';
import 'package:expense_tracker/views/onboarding/walkthrough.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColours.primaryColour),
        useMaterial3: true,
        fontFamily: 'Inter'
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.walkthrough: (context) => const WalkthroughScreen(),
        AppRoutes.signup: (context) => const SignupScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.verification: (context) => const VerificationScreen(),
        AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
        AppRoutes.forgotPasswordSent: (context) => const ForgotPasswordSentScreen(),
        AppRoutes.resetPassword: (context) => const ResetPasswordScreen(),
        AppRoutes.setupPin: (context) => const SetupPinScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}