import 'package:daraz_app/app/modules/auth/ui/main/desktop/desk_verification_screen.dart';
import 'package:daraz_app/app/modules/auth/ui/main/mobile/mob_verification_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helper/responsive_helper.dart';

class MainVerificationScreen extends StatelessWidget {
  const MainVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: isMobile ? MobVerificationScreen() : DeskVerificationScreen(),
    );
  }
}
