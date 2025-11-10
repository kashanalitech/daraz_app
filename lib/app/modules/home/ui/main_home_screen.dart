import 'package:daraz_app/app/modules/home/ui/desk_home_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/color/color.dart';
import '../../../utils/helper/responsive_helper.dart';
import 'mob_home_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white, body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Responsive(
      mobile: MobHomeScreen(),
      desktop: DeskHomeScreen(),
      tablet: DeskHomeScreen(),
    );
  }
}
