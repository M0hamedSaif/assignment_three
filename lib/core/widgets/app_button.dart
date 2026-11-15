import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import 'circle_button.dart';

class AppButton extends StatelessWidget {

  String text;
  VoidCallback onPressed;
  bool haveArrow;

  AppButton({required this.text,required this.onPressed,this.haveArrow=true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.red,
        foregroundColor: AppColors.white,
        elevation: 0,
        padding: const EdgeInsets.all(6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29),
        ),
      ),
      child: Row(
        mainAxisAlignment: haveArrow?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          CircleButton(onPressed: onPressed,isArrow: haveArrow,),
        ],
      ),
    );
  }
}