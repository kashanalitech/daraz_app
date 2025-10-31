import 'package:daraz_app/app/modules/auth/controller/forgot_password_controller.dart';
import 'package:daraz_app/app/modules/auth/controller/reset_password_controller.dart';
import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color/color.dart';
import '../../../../../utils/helper/helper_gaps.dart';
import '../../../../../utils/text_style/default_text_theme.dart';
import '../../../../../widgets/custom_filled_button.dart';
import '../../../../../widgets/validate_field.dart';

class MobForgotPasswordScreen extends StatelessWidget {
  const MobForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
    Get.find<ForgotPasswordController>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.back();
              },
              hoverColor: Colors.transparent,
              child: Icon(Icons.arrow_back, color: black, size: 20),
            ),
            gapH16,
            Text(
              "Forgot password",
              style: DefaultTextTheme.headline6(
                context,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH6,
            Text(
              "Enter your email for the verification process,\nWe will send you 4 digit code to your email",
              style: DefaultTextTheme.captionLarge(context, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
            gapH18,
            ValidatedField(
              labelText: 'Email',
              hintText: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
              required: false,
              controller: controller.resetPasswordController.value,
            ),
            gapH24,
            CustomFilledButton(
              text: "Send Code",
              textColor: Colors.white,
              borderColor: Colors.black,
              color: Colors.black,
              onPressed: () {
                controller.goToVerification();
              },
            ),
          ],
        ),
      ),
    );
  }
}
