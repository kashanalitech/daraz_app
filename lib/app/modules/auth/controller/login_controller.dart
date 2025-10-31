import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class  LoginController extends GetxController{
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void goToHome() {
    Get.offAllNamed(Routes.home); // ✅ Navigate & clear history
  }
  void goToForgotPassword() {
    Get.toNamed(Routes.forgotPassword); // ✅ Navigate & clear history
  }

  @override
  void onClose() {
    print("🧹 LoginController destroyed");
    super.onClose();
  }
}

// / ResetPasswordScreen se wapis aane ke liye
// void goBackToLogin() {
//   Get.back(); // ✅ Simple back
//   Ya
  // Get.until((route) => route.settings.name == Routes.login); // ✅ Specific screen tak back
// }