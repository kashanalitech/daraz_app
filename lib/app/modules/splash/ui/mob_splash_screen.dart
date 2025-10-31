import 'package:daraz_app/app/utils/color/color.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/app_icons.dart';

class MobSplashScreen extends StatelessWidget {
  const MobSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black,
      child: Center(child: AppIcon(icon: AppIcons.splashLogo,size: 150)),
    );
  }
}
