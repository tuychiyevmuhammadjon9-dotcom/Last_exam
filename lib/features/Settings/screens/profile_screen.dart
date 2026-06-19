import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/const/images/Appimages.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomBottomNavWIdget.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/Settings/widgets/CustomProfileWidget.dart';
import 'package:flutter_last_exam/features/Settings/widgets/InformationContainerWidget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;
  List<Map<String, dynamic>> profileItems = [
    {'icon': Appicons.person, 'text': 'Profile'},
    {'icon': Appicons.star, 'text': 'Favorite'},
    {'icon': Appicons.lock, 'text': 'Privacy Policy'},
    {'icon': Appicons.settings, 'text': 'Settings'},
    {'icon': Appicons.callcenter, 'text': 'Help'},
    {'icon': Appicons.exit, 'text': 'Logout'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(Appicons.left),
                  ),
                  SizedBox(width: 10),
                  Customtextwidget(
                    text: 'My Profile',
                    fontsize: 16,
                    fontWeight: FontWeight.bold,
                    color: Appcolors.white,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, AppPages.login);
                    },
                    child: SvgPicture.asset(
                      Appicons.exit,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Appimages.male),
              ),
              SizedBox(height: 3),
              Customtextwidget(
                text:
                    FirebaseAuth.instance.currentUser!.displayName ?? "No name",
                fontsize: 16,
                fontWeight: FontWeight.bold,
                color: Appcolors.white,
              ),
              Customtextwidget(
                text: FirebaseAuth.instance.currentUser!.email ?? "No email",
                fontsize: 14,
                fontWeight: FontWeight.w400,
                color: Appcolors.white,
              ),
              SizedBox(height: 7),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Brithday:',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Appcolors.white,
                      ),
                    ),
                    TextSpan(
                      text: ' April 1st',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Appcolors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              InformationContainerWidget(),
              SizedBox(height: 20),
              Column(
                children: List.generate(profileItems.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CustomProfileWidget(
                      text: profileItems[index]['text'],
                      icon: profileItems[index]['icon'],
                      onTap: () {},
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Custombottomnavwidget(
        currenindex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
