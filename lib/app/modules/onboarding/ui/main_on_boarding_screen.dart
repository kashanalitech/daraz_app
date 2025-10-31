import 'package:daraz_app/app/modules/onboarding/ui/desk_on_boarding_screen.dart';
import 'package:daraz_app/app/modules/onboarding/ui/mob_on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/responsive_helper.dart';

class MainOnBoardingScreen extends StatelessWidget {
  const MainOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Column(
        children: [isMobile ? MobOnBoardingScreen() : DeskOnBoardingScreen()],
      ),
    );
  }
}
