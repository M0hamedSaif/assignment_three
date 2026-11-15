import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CircleButton extends StatelessWidget {
  VoidCallback onPressed;
  bool isArrow;
   CircleButton({required this.onPressed,this.isArrow=true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 43,
      height: 43,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: CircleBorder(),
        ),
        child:  Icon(Icons.arrow_forward, size: 22,color: !isArrow?AppColors.transparent:AppColors.white,),
      ),
    );
  }
}