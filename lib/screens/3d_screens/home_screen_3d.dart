
import 'package:assignment_three/screens/3d_screens/details_screen_3d.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import 'package:assignment_three/core/widgets/custom_app_bar.dart';
import 'package:assignment_three/screens/details_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/circle_button.dart';
import '../../model/planet.dart';


class HomeScreen3d extends StatefulWidget {
  static const String routeName = '/home3d';

  @override
  State<HomeScreen3d> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen3d> {
  PageController pageController = PageController();


  Flutter3DController modelController = Flutter3DController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Planet planet = Planet.all[index];
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        title: "Explore",
        subtitle: "Which planet\nwould you like to explore?",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          spacing: 24,
          children: [
            Expanded(
              child: Center(

                child: PageView.builder(
                  controller: pageController,
                  itemCount: Planet.all.length,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemBuilder: (context, i) {

                    return Flutter3DViewer(
                      src: Planet.all[i].model,
                      progressBarColor: AppColors.transparent,

                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.flip(
                  flipX: true,
                  child: CircleButton(onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                    );
                  }),
                ),
                Text(
                  planet.name,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 24,
                    letterSpacing: -0.72,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                CircleButton(onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            AppButton(
              text: 'Explore ${planet.name}',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DetailsScreen3d.routeName,
                  arguments: planet,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
