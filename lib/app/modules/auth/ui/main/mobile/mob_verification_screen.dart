import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color/color.dart';
import '../../../../../utils/constants/app_constant.dart';
import '../../../../../utils/helper/helper_gaps.dart';
import '../../../../../utils/text_style/default_text_theme.dart';
import '../../../../../widgets/custom_filled_button.dart';
import '../../../../../widgets/validate_field.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controller/verification_controller.dart';

class MobVerificationScreen extends StatelessWidget {
  MobVerificationScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final VerificationController controller =
    Get.find<VerificationController>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.back(),
              hoverColor: Colors.transparent,
              child: Icon(Icons.arrow_back, color: black, size: 20),
            ),
            gapH16,
            Text(
              "Enter 4 Digit Code",
              style: DefaultTextTheme.headline6(
                context,
                fontWeight: FontWeight.bold,
              ),
            ),
            gapH6,
            Text(
              "Enter your 4 digit code that your receive on your\n email (sal@gmail.com)",
              style: DefaultTextTheme.captionLarge(context, color: Colors.grey),
              textAlign: TextAlign.start,
            ),
            gapH18,

            // 👇 4 Digit Code Boxes
            Center(
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                controller: controller.pinController.value,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeFillColor: Colors.white,
                  activeColor: Colors.black,
                  selectedColor: Colors.black,
                  inactiveColor: Colors.grey.shade300,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                ),
                textStyle: DefaultTextTheme.headline6(context),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  print("Completed: $v");
                  // Auto submit yahan kar sakte hain
                },
                onChanged: (value) {
                  print(value);
                },
              ),
            ),

            gapH24,
            CustomFilledButton(
              text: "Verify Code",
              textColor: Colors.white,
              borderColor: Colors.black,
              color: Colors.black,
              onPressed: () {
                controller.goToResetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }
}