import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/theme/Apptheme.dart';
import 'package:flutter_last_exam/features/Auth/cubit/auth_cubit.dart';
import 'package:flutter_last_exam/features/Home/cubit/Home_cubit.dart';
import 'package:flutter_last_exam/features/Home/screens/home_screen.dart';
import 'package:flutter_last_exam/features/Onboarding/screens/splash_screen.dart';
import 'package:flutter_last_exam/features/SetUp/cubit/Setup_cubit.dart';
import 'package:flutter_last_exam/firebase_options.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SetupCubit()),
        BlocProvider(create: (context) => HomeCubit()..loadExercises(limit: 5)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snap) {
        return ToastificationWrapper(
          child: MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            title: 'Exam Project 3',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.onGenerateRoute,
            home: snap.hasData ? const HomeScreen() : const SplashScreen(),
          ),
        );
      },
    );
  }
}
