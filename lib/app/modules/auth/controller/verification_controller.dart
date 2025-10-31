import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class VerificationController extends GetxController{
  final pinController = TextEditingController().obs;

  void goToResetPassword() {
    Get.toNamed(Routes.resetPassword); // ✅ Navigate & clear history
  }

  @override
  void onClose() {
    print("🧹 VerificationController destroyed");
    super.onClose();
  }
}