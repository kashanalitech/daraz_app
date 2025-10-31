import 'package:daraz_app/app/modules/auth/ui/main/desktop/desk_forgot_password_screen.dart';
import 'package:daraz_app/app/modules/auth/ui/main/mobile/mob_forgot_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/helper/responsive_helper.dart';

class MainForgotPasswordScreen extends StatelessWidget {
  const MainForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          isMobile ? MobForgotPasswordScreen() : DeskForgotPasswordScreen(),
        ],
      ),
    );
  }
}
