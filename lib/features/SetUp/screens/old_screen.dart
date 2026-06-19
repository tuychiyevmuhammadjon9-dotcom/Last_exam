import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomTapwidet.dart';
import 'package:flutter_last_exam/features/SetUp/cubit/Setup_cubit.dart';
import 'package:flutter_last_exam/features/SetUp/cubit/Setup_state.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/AgePickerWidget.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomAppbarSetup.dart';
import 'package:flutter_last_exam/features/SetUp/widgets/CustomTitleWidget.dart';

class OldScreen extends StatefulWidget {
  const OldScreen({super.key});

  @override
  State<OldScreen> createState() => _OldScreenState();
}

class _OldScreenState extends State<OldScreen> {
  int age = 1;

  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbarSetup(
          ontap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocConsumer<SetupCubit, SetupState>(
        listener: (context, state) {
          if (state.age != null) {
            age = state.age!;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 20),
              CustomTitleWIdget(
                textcolor: Appcolors.white,
                text: 'How Old Are You?',
                color: Appcolors.primary,
              ),
              SizedBox(height: 140),

              AgePickerWidget(
                age: age,
                pageController: pageController,
                onPageChanged: (value) {
                  setState(() {
                    age = value + 1;
                  });
                },
              ),
              Spacer(),
              CustomTapwidget(
                text: 'Continue',
                onTap: () {
                  context.read<SetupCubit>().selectAge(age.toDouble());
                  Navigator.pushNamed(context, AppPages.weight);
                },
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
