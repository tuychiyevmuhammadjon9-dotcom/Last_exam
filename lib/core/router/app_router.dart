import 'package:flutter/material.dart';
import 'package:flutter_last_exam/features/Auth/screens/forgot_password_screen.dart';
import 'package:flutter_last_exam/features/Auth/screens/login_screen.dart';
import 'package:flutter_last_exam/features/Onboarding/screens/onboarding_screen.dart';
import 'package:flutter_last_exam/features/Onboarding/screens/splash_screen.dart';
import 'package:flutter_last_exam/features/Onboarding/screens/welcome_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppPages.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case AppPages.welcome:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case AppPages.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case AppPages.forgotpassword:
        return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
      default:
        return null;
    }
  }
}

class AppPages {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String forgotpassword = '/forgotpassword';
}
