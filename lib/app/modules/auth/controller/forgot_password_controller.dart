import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final resetPasswordController = TextEditingController().obs;

  void goToVerification() {
    Get.toNamed(Routes.verification); // ✅ Navigate & clear history
  }

  @override
  void onClose() {
    print("🧹 ForgotPasswordController destroyed");
    super.onClose();
  }
}