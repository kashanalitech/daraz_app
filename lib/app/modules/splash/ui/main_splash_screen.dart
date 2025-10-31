import 'package:daraz_app/app/modules/splash/ui/desk_splash_screen.dart';
import 'package:daraz_app/app/modules/splash/ui/mob_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/responsive_helper.dart';

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [isMobile ? MobSplashScreen() : DeskSplashScreen()],
    );
  }
}
