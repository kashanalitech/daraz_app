import 'package:daraz_app/app/modules/profile/ui/main/desk_profile_screen.dart';
import 'package:daraz_app/app/modules/profile/ui/main/mob_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helper/responsive_helper.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: Column(
        children: [isMobile ? MobProfileScreen() : DeskProfileScreen()],
      ),
    );
  }
}
