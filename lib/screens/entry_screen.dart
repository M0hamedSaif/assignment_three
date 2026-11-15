import 'package:assignment_three/core/constants/app_colors.dart';
import 'package:assignment_three/core/constants/app_images.dart';
import 'package:assignment_three/core/widgets/app_button.dart';
import 'package:assignment_three/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '3d_screens/home_screen_3d.dart';

class EntryScreen extends StatelessWidget {
  static const String routeName = '/entry';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.sample,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Explore\nThe\nUniverse",
                style: GoogleFonts.inter(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,

                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 22,left: 16,right: 16),
              child: AppButton(
                onPressed:(){
                  showVersionDialog(context);
                } ,
                  text: "Explore"
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showVersionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          backgroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Text(
                  'Choose your version',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: AppButton(
                        haveArrow: false,
                        text: 'Normal',
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                      ),
                    ),
                    Expanded(
                      child: AppButton(
                        haveArrow: false,
                        text: '3D',
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          Navigator.pushNamed(context, HomeScreen3d.routeName);
                        },
                      ),
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
