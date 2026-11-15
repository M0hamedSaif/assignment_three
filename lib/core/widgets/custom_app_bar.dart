import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_images.dart';
import 'circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  String subtitle;
  bool showBack;

  CustomAppBar({
    required this.title,
    required this.subtitle,
    this.showBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(237);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.black,
      centerTitle: true,

      title: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),

          if (showBack)
            Align(
              alignment: Alignment.centerLeft,
              child: Transform.flip(flipX: true, child: CircleButton(onPressed: () => Navigator.pop(context),)),
            ),
        ],
      ),
      flexibleSpace: Stack(
        fit: StackFit.expand,
        children: [
          Transform.flip(
            flipY: true,
            child: Image.asset(AppImages.background, fit: BoxFit.cover),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.transparent, AppColors.black],
              ),
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(181),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 10),
            child: Text(
              subtitle,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
