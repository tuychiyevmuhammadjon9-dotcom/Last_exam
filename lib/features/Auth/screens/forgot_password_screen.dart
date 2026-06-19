import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomInputWidget.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/Auth/cubit/auth_cubit.dart';
import 'package:flutter_last_exam/features/Auth/cubit/auth_state.dart';
import 'package:flutter_last_exam/features/Auth/widgets/CustomappbarAuth.dart';
import 'package:toastification/toastification.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbarAuth(
          text: 'Forgotten Password',
          ontap: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Appcolors.background,
      body: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) {
          return previous.runtimeType != current.runtimeType;
        },
        listener: (context, state) {
          if (state is AuthPasswordResetSuccess) {
            toastification.show(
              type: ToastificationType.success,
              title: Customtextwidget(
                text: "Check your email!",
                fontsize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            );
          } else if (state is AuthError) {
            toastification.show(
              type: ToastificationType.error,
              title: Customtextwidget(
                text: state.errortext,
                fontsize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            );
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),

              SizedBox(height: 50),
              Customtextwidget(
                text: 'Forgot Password ?',
                fontsize: 15,
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
              SizedBox(height: 20),
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
                          text: 'Enter your email address',
                          fontsize: 12,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.background,
                        ),
                        SizedBox(height: 7),
                        CustomInputWidget(
                          hintText: 'Username or Email',
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username or email';
                            } else if (!value.contains('@gmail.com')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return CircularProgressIndicator();
                  }
                  return CustomTapwidget(
                    text: 'Continue',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        context.read<AuthCubit>().forgotPassword(
                          email: usernameController.text,
                        );
                        Navigator.pushNamed(context, AppPages.login);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
