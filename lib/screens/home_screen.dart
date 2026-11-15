import 'package:assignment_three/core/widgets/custom_app_bar.dart';
import 'package:assignment_three/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_images.dart';
import '../core/widgets/app_button.dart';
import '../core/widgets/circle_button.dart';
import '../model/planet.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
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
                  controller: controller,
                  itemCount: Planet.all.length,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemBuilder: (context, i) => Image.asset(Planet.all[i].image),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.flip(
                  flipX: true,
                  child: CircleButton(onPressed: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds:200),
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
                  controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                }),
              ],
            ),
            SizedBox(height: 20),
            AppButton(text: 'Explore ${planet.name}', onPressed: () {
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: planet
              );
            }),
          ],
        ),
      ),
    );
  }
}
