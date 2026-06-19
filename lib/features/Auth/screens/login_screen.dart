import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/service/GoogleService.dart';
import 'package:flutter_last_exam/core/widgets/CustomInputWidget.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/Auth/cubit/auth_cubit.dart';
import 'package:flutter_last_exam/features/Auth/cubit/auth_state.dart';
import 'package:flutter_last_exam/features/Auth/widgets/CustomappbarAuth.dart';
import 'package:flutter_last_exam/features/Auth/widgets/CustomhaveaccountWidget.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Appimages.google,
      Appimages.facebook,
      Appimages.fingerprint,
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbarAuth(text: 'Log In', ontap: () {}),
      ),
      backgroundColor: Appcolors.background,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            toastification.show(
              type: ToastificationType.error,
              title: Customtextwidget(
                text: state.errortext,
                fontsize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            );
          } else if (state is AuthLoaded) {
            toastification.show(
              type: ToastificationType.success,
              title: Customtextwidget(
                text: "Successfully authorized",
                fontsize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            );
            Navigator.pushNamed(context, AppPages.setup);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Customtextwidget(
                  text: 'Welcome',
                  fontsize: 14,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.white,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Customtextwidget(
                    textalign: TextAlign.center,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    fontsize: 9,
                    fontWeight: FontWeight.w400,
                    color: Appcolors.white,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Appcolors.primary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Customtextwidget(
                            text: 'Username or Email',
                            fontsize: 12,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.background,
                          ),
                          SizedBox(height: 7),
                          CustomInputWidget(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username or email';
                              } else if (!value.contains('@gmail.com')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            hintText: 'Username or Email',
                            controller: usernameController,
                          ),
                          SizedBox(height: 20),
                          Customtextwidget(
                            text: 'Password',
                            fontsize: 12,
                            fontWeight: FontWeight.w500,
                            color: Appcolors.background,
                          ),
                          SizedBox(height: 7),
                          CustomInputWidget(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            hintText: 'Password',
                            controller: passwordController,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppPages.forgotpassword,
                                  );
                                },
                                child: Customtextwidget(
                                  textalign: TextAlign.end,
                                  text: 'Forgot Password?',
                                  fontsize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Appcolors.background,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomTapwidget(
                  text: 'Log In',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      context.read<AuthCubit>().signIn(
                        email: usernameController.text,
                        password: passwordController.text,
                      );
                      Navigator.pushNamed(context, AppPages.setup);
                    } else {
                      Toastification().show(
                        context: context,
                        title: Customtextwidget(
                          text: 'Please enter your username or email',
                          fontsize: 12,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.white,
                        ),
                        type: ToastificationType.error,
                        alignment: Alignment.topCenter,
                        autoCloseDuration: const Duration(seconds: 3),
                      );
                    }
                  },
                ),
                SizedBox(height: 20),
                Customtextwidget(
                  text: 'or sign up with',
                  fontsize: 9,
                  fontWeight: FontWeight.w500,
                  color: Appcolors.white,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () async {
                          final user = await GoogleAuthService.signInWithGoogle(
                            true,
                          );
                          if (user != null) {
                            debugPrint("Success: ${user.email}");
                            if (context.mounted) {
                              Navigator.pushNamed(context, AppPages.setup);
                            }
                          } else {
                            debugPrint("Google sign in failed");
                          }
                        },
                        child: Image.asset(
                          images[index],
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                CustomhaveaccountWidget(
                  text: 'Don’t have an account?',
                  text2: 'Sign Up',
                  ontap: () {
                    Navigator.pushNamed(context, AppPages.createaccount);
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
