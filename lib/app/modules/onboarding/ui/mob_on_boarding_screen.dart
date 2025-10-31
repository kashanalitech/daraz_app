import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/helper/helper_gaps.dart';
import 'package:daraz_app/app/utils/text_style/default_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constants/app_icons.dart';
import '../../../widgets/custom_filled_button.dart';
import '../controller/on_boarding_controller.dart';


class MobOnBoardingScreen extends StatelessWidget {
  const MobOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller =
    Get.find<OnboardingController>();
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            // 🧠 Background Text
            Padding(
              padding:  EdgeInsets.all(AppConstants.defaultPadding),
              child: Text(
                "Define\nyourself in\nyour unique\nway.",
                style: DefaultTextTheme.headline1Bold(
                  context,
                  size: 42,
                  color: Colors.black,
                ),
              ),
            ),

            // 🖼️ Person Image (right side)
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                AppIcons.personImage,
                height: height * 0.9,
                fit: BoxFit.cover,
              ),
            ),

            // 🚀 Button fixed to bottom

          ],
        ),
        gapH16,
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:  AppConstants.defaultPadding),
          child: CustomFilledButton(
            text: "Get Started",
            textColor: Colors.white,
            borderColor: Colors.black,
            color: Colors.black,
            onPressed: () {
              controller.goToLogin();

            },
            endIcon: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
          ),
        ),
      ],
    );
  }
}
