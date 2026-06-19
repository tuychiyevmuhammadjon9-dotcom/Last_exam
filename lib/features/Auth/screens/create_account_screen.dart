import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/service/GoogleService.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/Auth/cubit/auth_cubit.dart';
import 'package:flutter_last_exam/features/Auth/cubit/auth_state.dart';
import 'package:flutter_last_exam/features/Auth/widgets/CustomSignWidget.dart';
import 'package:flutter_last_exam/features/Auth/widgets/CustomappbarAuth.dart';
import 'package:flutter_last_exam/features/Auth/widgets/CustomhaveaccountWidget.dart';
import 'package:toastification/toastification.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  List<String> images = [
    Appimages.google,
    Appimages.facebook,
    Appimages.fingerprint,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbarAuth(
          text: 'Create Account',
          ontap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (previous, current) {
          return previous.runtimeType != current.runtimeType;
        },
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
              children: [
                SizedBox(height: 20),
                Customtextwidget(
                  text: 'Let\'s Start!',
                  fontsize: 15,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.white,
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Appcolors.primary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: formkey,
                      child: CustomsignWidget(
                        usernameController: usernameController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: '    By continuing, you agree to\n ',
                    style: TextStyle(
                      color: Appcolors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),

                    children: [
                      TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                          color: Appcolors.textprimary,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          color: Appcolors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(
                          color: Appcolors.textprimary,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomTapwidget(
                  text: 'Sign Up',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.pushNamed(context, AppPages.setup);
                      context.read<AuthCubit>().signUp(
                        email: usernameController.text,
                        password: passwordController.text,
                      );
                    } else {
                      Toastification().show(
                        type: ToastificationType.error,
                        title: Customtextwidget(
                          text: "Please enter your username or email",
                          fontsize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 20),
                Customtextwidget(
                  text: 'or sign up with',
                  fontsize: 9,
                  fontWeight: FontWeight.w400,
                  color: Appcolors.white,
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 10),
                CustomhaveaccountWidget(
                  text: 'Already have an account?',
                  text2: 'Log in',
                  ontap: () {
                    Navigator.pushNamed(context, AppPages.login);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
