import 'package:daraz_app/app/modules/auth/controller/login_controller.dart';
import 'package:daraz_app/app/utils/color/color.dart';
import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/helper/helper_gaps.dart';
import 'package:daraz_app/app/utils/text_style/default_text_theme.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_icons.dart';
import '../../../../../widgets/custom_filled_button.dart';
import '../../../../../widgets/validate_field.dart';

class MobLoginScreen extends StatelessWidget {
  const MobLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login to your account",
            style: DefaultTextTheme.headline6(
              context,
              fontWeight: FontWeight.bold,
            ),
          ),
          gapH6,
          Text(
            "It's great to see your account",
            style: DefaultTextTheme.captionLarge(context, color: Colors.grey),
          ),
          gapH16,
          ValidatedField(
            labelText: 'Email',
            hintText: 'Enter your email address',
            keyboardType: TextInputType.emailAddress,
            required: true,
            controller: controller.emailController.value,
          ),
          gapH10,
          ValidatedField(
            labelText: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            required: true,
            controller: controller.passwordController.value,
          ),
          gapH10,
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              controller.goToForgotPassword();

            },
            child: RichText(
              text: TextSpan(
                text: "Forgot your password? ",
                style: DefaultTextTheme.captionLarge(context, color: darkGrey),
                children: <TextSpan>[
                  TextSpan(
                    text: "Reset your password",
                    style: DefaultTextTheme.captionLarge(context, color: black)
                        .copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: black,
                          decorationThickness: 1.5,
                        ),
                  ),
                ],
              ),
            ),
          ),
          gapH16,
          CustomFilledButton(
            text: "Login",
            textColor: Colors.white,
            borderColor: Colors.black,
            color: Colors.black,
            onPressed: () {
              controller.goToHome();
              },
          ),
          gapH16,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: divider),
              gapW6,
              Text(
                'Or',
                style: DefaultTextTheme.captionLarge(context, color: darkGrey),
              ),
              gapW6,
              Expanded(child: divider),
            ],
          ),
          gapH16,
          CustomFilledButton(
            text: "Login with google",
            borderColor: fieldBorderColor,
            color: white,
            onPressed: () {
              // controller.goToLogin();
            },
            icon: AppIcon(icon: AppIcons.googleLogo, size: 15),
          ),
          gapH16,
          CustomFilledButton(
            text: "Login with Facebook",
            textColor: white,
            borderColor: facebookBorder,
            color: facebookBorder,
            onPressed: () {

            },
            icon: AppIcon(icon: AppIcons.facebookLogo, size: 15),
          ),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              // Add your reset password navigation here
              // Get.to(() => ResetPasswordScreen());
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: DefaultTextTheme.subtitle1(context, color: darkGrey),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Join",
                      style: DefaultTextTheme.subtitle1(context, color: black)
                          .copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: black,
                            decorationThickness: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
