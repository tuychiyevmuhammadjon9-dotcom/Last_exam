import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last_exam/core/const/colors/Appcolors.dart';
import 'package:flutter_last_exam/core/const/icons/Appicons.dart';
import 'package:flutter_last_exam/core/router/app_router.dart';
import 'package:flutter_last_exam/core/widgets/CustomBottomNavWIdget.dart';
import 'package:flutter_last_exam/core/widgets/CustomTextWidget.dart';
import 'package:flutter_last_exam/features/Home/cubit/Home_cubit.dart';
import 'package:flutter_last_exam/features/Home/cubit/Home_state.dart';
import 'package:flutter_last_exam/features/Home/widgets/CustomSeeAllWidget.dart';
import 'package:flutter_last_exam/features/Home/widgets/CustomWorkoutWidget.dart';
import 'package:flutter_last_exam/features/Home/widgets/CustomcategoryWidget.dart';
import 'package:flutter_last_exam/features/Home/widgets/CustomhomeContainer.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  int isfavorite = 0;
  int selectedIndex = 0;
  List<String> category = [
    'Workout',
    'Progress\ntracking',
    'Nutrition',
    'Community',
  ];
  List<String> categoryicons = [
    Appicons.category1,
    Appicons.category2,
    Appicons.category3,
    Appicons.category4,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.background,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Row(
              children: [
                SvgPicture.asset(Appicons.search, height: 20, width: 20),
                SizedBox(width: 10),
                SvgPicture.asset(Appicons.notification, height: 20, width: 20),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppPages.profile);
                  },
                  child: SvgPicture.asset(Appicons.user, height: 20, width: 20),
                ),
              ],
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: Appcolors.background,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListTile(
            title: Customtextwidget(
              text:
                  'Hi, ${FirebaseAuth.instance.currentUser?.displayName ?? "User"}',
              fontsize: 16,
              fontWeight: FontWeight.bold,
              color: Appcolors.dotcolor,
            ),
            subtitle: Customtextwidget(
              text: 'It is time to challenge your limits',
              fontsize: 14,
              fontWeight: FontWeight.w400,
              color: Appcolors.white,
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == HomeStatus.success ||
              state.status == HomeStatus.error) {
            final Homemodel = [
              (
                id: '1',
                title: 'Push-ups',
                image:
                    'https://plus.unsplash.com/premium_photo-1661265933107-85a5dbd815af?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8d29ya291dHxlbnwwfHwwfHx8MA%3D%3D',
                duration: 30,
                kcal: 150,
              ),
              (
                id: '2',
                title: 'Squats',
                image:
                    'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHdvcmtvdXR8ZW58MHx8MHx8fDA%3D',
                duration: 13,
                kcal: 510,
              ),
              (
                id: '3',
                title: 'Plank',
                image:
                    'https://images.unsplash.com/photo-1607962837359-5e7e89f86776?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHdvcmtvdXR8ZW58MHx8MHx8fDA%3D',
                duration: 27,
                kcal: 150,
              ),
              (
                id: '4',
                title: 'Lunges',
                image:
                    'https://plus.unsplash.com/premium_photo-1670505062582-fdaa83c23c9e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d29ya291dHxlbnwwfHwwfHx8MA%3D%3D',
                duration: 15,
                kcal: 130,
              ),
            ];
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(category.length, (index) {
                        return Row(
                          children: [
                            CustomcategoryWidget(
                              title: category[index],
                              icon: categoryicons[index],
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              isSelected: index == selectedIndex,
                            ),
                            SizedBox(width: 12.5),
                            if (index != category.length - 1)
                              Container(
                                width: 1,
                                height: 40,
                                color: Appcolors.primary,
                              ),
                            SizedBox(width: 12.5),
                          ],
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomSeeAllWIdget(title: 'Recomendation'),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Customworkoutwidget(
                          onTap: () {
                            setState(() {
                              isfavorite = 1;
                            });
                          },
                          duration: Homemodel[0].duration.toString(),
                          title: Homemodel[0].title,
                          kcal: Homemodel[0].kcal.toDouble(),
                          isFavorite: isfavorite == 1 ? true : false,
                          imageUrl: Homemodel[0].image,
                        ),
                        Spacer(),
                        Customworkoutwidget(
                          duration: Homemodel[1].duration.toString(),
                          title: Homemodel[1].title,
                          kcal: Homemodel[1].kcal.toDouble(),
                          isFavorite: isfavorite == 0 ? true : false,
                          imageUrl: Homemodel[1].image,
                          onTap: () {
                            setState(() {
                              isfavorite = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomhomeContainer(),
                  SizedBox(height: 20),
                  CustomSeeAllWIdget(title: 'Articlec & Tips'),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Customworkoutwidget(
                          title: Homemodel[2].title,
                          duration: Homemodel[2].duration.toString(),
                          kcal: Homemodel[2].kcal.toDouble(),
                          isFavorite: false,
                          imageUrl: Homemodel[2].image,
                          onTap: () {},
                        ),
                        Spacer(),
                        Customworkoutwidget(
                          title: Homemodel[3].title,
                          duration: Homemodel[3].duration.toString(),
                          kcal: Homemodel[3].kcal.toDouble(),
                          isFavorite: false,
                          imageUrl: Homemodel[3].image,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
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
