import 'package:daraz_app/app/modules/search/ui/desk_search_screen.dart';
import 'package:daraz_app/app/modules/search/ui/mob_search_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/color/color.dart';
import '../../../utils/helper/responsive_helper.dart';

class MainSearchScreen extends StatelessWidget {
  const MainSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [isMobile ? MobSearchScreen() : DeskSearchScreen()],
      ),
    );
  }
}
