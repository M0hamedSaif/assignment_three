import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../model/planet.dart';

class DetailsScreen3d extends StatelessWidget {
  static const String routeName = '/details3d';

  @override
  Widget build(BuildContext context) {
    Planet planet = ModalRoute.of(context)!.settings.arguments as Planet;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        title: planet.name,
        subtitle: planet.title,
        showBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 9, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 343,
                width: double.infinity,
                child: Flutter3DViewer(
                  src: planet.model,
                  progressBarColor: AppColors.transparent,
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      'About',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      planet.about,
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                        height: 22 / 16,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Distance from Sun (km) : ${planet.distance}\n\n'
                      'Length of Day (hours) : ${planet.dayLength}\n\n'
                      'Orbital Period (Earth years) : ${planet.orbitalPeriod}\n\n'
                      'Radius (km) : ${planet.radius}\n\n'
                      'Mass (kg) : ${planet.mass}\n\n'
                      'Gravity (m/s²) : ${planet.gravity}\n\n'
                      'Surface Area (km²) : ${planet.surfaceArea}',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 16,
                        height: 1.1,
                        letterSpacing: -0.48,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
