import 'package:daraz_app/app/modules/auth/ui/main/desktop/desk_login_screen.dart';
import 'package:daraz_app/app/modules/auth/ui/main/mobile/mob_login_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/helper/responsive_helper.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return  Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [isMobile ? MobLoginScreen() : DeskLoginScreen()],
        ),
      ),
    );
  }
}
