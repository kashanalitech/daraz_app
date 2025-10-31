import 'package:daraz_app/app/modules/auth/controller/reset_password_controller.dart';
import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color/color.dart';
import '../../../../../utils/helper/helper_gaps.dart';
import '../../../../../utils/text_style/default_text_theme.dart';
import '../../../../../widgets/custom_filled_button.dart';
import '../../../../../widgets/validate_field.dart';
import '../../widgets/password_changed_dialog.dart';

class MobResetPasswordScreen extends StatelessWidget {
  const MobResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
        Get.find<ResetPasswordController>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              hoverColor: Colors.transparent,
              child: Icon(Icons.arrow_back, color: black, size: 20),
            ),
            gapH16,
            Text(
              "Reset Password",
              style: DefaultTextTheme.headline6(
                context,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH6,
            Text(
              "Set the new password for your account so you\ncan login and access all the features",
              style: DefaultTextTheme.captionLarge(context, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
            gapH18,
            ValidatedField(
              labelText: 'Password',
              hintText: 'Enter your Password',
              keyboardType: TextInputType.visiblePassword,
              required: false,
              controller: controller.resetPasswordController.value,
            ),
            gapH10,
            ValidatedField(
              labelText: 'Confirm Password',
              hintText: 'Enter your Confirm Password',
              keyboardType: TextInputType.visiblePassword,
              required: false,
              controller: controller.confirmPasswordController.value,
            ),
            gapH24,
            CustomFilledButton(
              text: "Continue",
              textColor: Colors.white,
              borderColor: Colors.black,
              color: Colors.black,
              onPressed: () {
                CustomDialog.showDialogSheet(PasswordChangedDialog(),padding: EdgeInsets.symmetric(horizontal: 12));
              },
            ),
          ],
        ),
      ),
    );
  }
}
