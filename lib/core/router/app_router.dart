import 'package:flutter/material.dart';
import 'package:flutter_last_exam/features/Auth/screens/create_account_screen.dart';
import 'package:flutter_last_exam/features/Auth/screens/forgot_password_screen.dart';
import 'package:flutter_last_exam/features/Auth/screens/login_screen.dart';
import 'package:flutter_last_exam/features/Home/screens/home_screen.dart';
import 'package:flutter_last_exam/features/Onboarding/screens/onboarding_screen.dart';
import 'package:flutter_last_exam/features/Onboarding/screens/splash_screen.dart';
import 'package:flutter_last_exam/features/Onboarding/screens/welcome_screen.dart';
import 'package:flutter_last_exam/features/SetUp/screens/gender_screen.dart';
import 'package:flutter_last_exam/features/SetUp/screens/goal_screen.dart';
import 'package:flutter_last_exam/features/SetUp/screens/height_screen.dart';
import 'package:flutter_last_exam/features/SetUp/screens/old_screen.dart';
import 'package:flutter_last_exam/features/SetUp/screens/physical_level_screen.dart';
import 'package:flutter_last_exam/features/SetUp/screens/setup_screen.dart';
import 'package:flutter_last_exam/features/SetUp/screens/weight_screen.dart';
import 'package:flutter_last_exam/features/Settings/screens/profile_screen.dart';

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
      case AppPages.createaccount:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen());
      case AppPages.setup:
        return MaterialPageRoute(builder: (context) => SetupScreen());
      case AppPages.gender:
        return MaterialPageRoute(builder: (context) => GenderScreen());
      case AppPages.old:
        return MaterialPageRoute(builder: (context) => OldScreen());
      case AppPages.weight:
        return MaterialPageRoute(builder: (context) => WeightScreen());
      case AppPages.height:
        return MaterialPageRoute(builder: (context) => HeightScreen());
      case AppPages.goal:
        return MaterialPageRoute(builder: (context) => GoalScreen());
      case AppPages.physicallevel:
        return MaterialPageRoute(builder: (context) => PhysicalLevelScreen());
      case AppPages.profile:
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case AppPages.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return null;
    }
  }
}

class AppPages {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String physicallevel = '/physicallevel';
  static const String goal = '/goal';
  static const String height = '/height';
  static const String old = '/old';
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String forgotpassword = '/forgotpassword';
  static const String createaccount = '/createaccount';
  static const String setup = '/setup';
  static const String gender = '/gender';
  static const String weight = '/weight';
}
