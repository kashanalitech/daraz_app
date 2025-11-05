import 'package:daraz_app/app/modules/saved/ui/desk_saved_screen.dart';
import 'package:daraz_app/app/modules/saved/ui/mob_saved_screen.dart';
import 'package:daraz_app/app/utils/color/color.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/responsive_helper.dart';

class MainSavedScreen extends StatelessWidget {
  const MainSavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: white,
      body: Column(children: [isMobile ? MobSavedScreen() : DeskSavedScreen()]),
    );
  }
}
