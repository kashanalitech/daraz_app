import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color/color.dart';
import '../utils/constants/app_icons.dart';
import '../utils/text_style/default_text_theme.dart';
import 'app_icon.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: black, size: 22),
        ),
        Text(title, style: DefaultTextTheme.headline7(context)),
        AppIcon(icon: AppIcons.notificationIcon, size: 22),
      ],
    );
  }
}
