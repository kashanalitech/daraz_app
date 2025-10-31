import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class ResetPasswordController extends GetxController{
  final resetPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  void goToVerification() {
    Get.toNamed(Routes.verification); // ✅ Navigate & clear history
  }

  void goToLogin() {
    Get.offAllNamed(Routes.login); // ✅ Navigate & clear history
  }

  @override
  void onClose() {
    print("🧹 ResetPasswordController destroyed");
    super.onClose();
  }
}