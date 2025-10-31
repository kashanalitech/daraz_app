import 'package:daraz_app/app/utils/color/color.dart';
import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/helper/helper_gaps.dart';
import 'package:daraz_app/app/utils/text_style/default_text_theme.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/app_icons.dart';
import '../../../../widgets/custom_filled_button.dart';
import '../../controller/reset_password_controller.dart';

class PasswordChangedDialog extends StatelessWidget {
  const PasswordChangedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
    Get.find<ResetPasswordController>();
    return SizedBox(
      width: 400,
      child: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon: AppIcons.checkSuccessIcon, size: 55),
            gapH16,
            Text(
              "Password Changed!",
              style: DefaultTextTheme.headline6(context,fontWeight: FontWeight.w700),
            ),
            // gapH6,
            Text(
              "You can now use your new password to\n login into your account",
              style: DefaultTextTheme.subtitle1(context, color: darkGrey),
            ),
            gapH16,
            CustomFilledButton(
              text: "Login",
              textColor: Colors.white,
              borderColor: Colors.black,
              color: Colors.black,
              onPressed: () {
                controller.goToLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
