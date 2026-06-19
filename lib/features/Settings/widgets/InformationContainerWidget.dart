import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/SetUp/cubit/Setup_cubit.dart';
import 'package:flutter_last_exam/features/SetUp/cubit/Setup_state.dart';

class InformationContainerWidget extends StatelessWidget {
  const InformationContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupCubit, SetupState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Appcolors.dotcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtextwidget(
                      text: '${state.weight} kg',
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.white,
                    ),
                    Customtextwidget(
                      text: 'weight',
                      fontsize: 15,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.white,
                    ),
                  ],
                ),
                Container(width: 2, height: 50, color: Appcolors.white),
                SizedBox(width: 20),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtextwidget(
                      text: '${state.age}',
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.white,
                    ),
                    Customtextwidget(
                      text: 'years old',
                      fontsize: 15,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.white,
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Container(width: 2, height: 50, color: Appcolors.white),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtextwidget(
                      text: '${state.height} cm',
                      fontsize: 16,
                      fontWeight: FontWeight.bold,
                      color: Appcolors.white,
                    ),
                    Customtextwidget(
                      text: 'height',
                      fontsize: 15,
                      fontWeight: FontWeight.w400,
                      color: Appcolors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
