import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightPickerWidget extends StatefulWidget {
  final double initialHeight;
  final ValueChanged<int> onChanged;

  const HeightPickerWidget({
    super.key,
    required this.initialHeight,
    required this.onChanged,
  });

  @override
  State<HeightPickerWidget> createState() => _HeightPickerWidgetState();
}

class _HeightPickerWidgetState extends State<HeightPickerWidget> {
  late FixedExtentScrollController controller;
  late int selectedHeight;

  @override
  void initState() {
    super.initState();

    selectedHeight = widget.initialHeight.toInt();

    controller = FixedExtentScrollController(initialItem: selectedHeight - 140);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$selectedHeight',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: ' Cm',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          height: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: ListWheelScrollView.useDelegate(
                  controller: controller,
                  itemExtent: 70,
                  diameterRatio: 100,
                  perspective: 0.001,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedHeight = index + 140;
                    });

                    widget.onChanged(selectedHeight);
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 81,
                    builder: (context, index) {
                      final value = index + 140;

                      final number = (selectedHeight - value).abs();

                      return Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 150),
                          style: GoogleFonts.poppins(
                            fontSize: number == 0
                                ? 40
                                : number == 1
                                ? 30
                                : number == 2
                                ? 25
                                : 20,
                            fontWeight: FontWeight.w700,
                            color: number == 0
                                ? Colors.white
                                : number == 1
                                ? Colors.white70
                                : number == 2
                                ? Colors.white54
                                : Colors.white38,
                          ),
                          child: Text('$value'),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 24),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: 60,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Appcolors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          15,
                          (index) => Container(
                            width: index == 7
                                ? 56
                                : index == 2
                                ? 36
                                : index == 4
                                ? 46
                                : index == 10
                                ? 46
                                : index == 12
                                ? 36
                                : 24,
                            height: 2,
                            color: index == 7
                                ? Appcolors.textprimary
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: -24,
                    child: SvgPicture.asset(
                      Appicons.left,
                      width: 34,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
