import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/enums/user_role.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var selectedRole = UserRole.user.obs;

  void onRoleChanged(UserRole? role) {
    if (role != null) selectedRole.value = role;
  }

  void goToForgotPassword() {
    Get.toNamed('/forgotPassword');
  }

  void goToHome() {
    final role = selectedRole.value;
    if (role == UserRole.admin) {
      Get.offAllNamed('/adminDashboard');
    } else if (role == UserRole.seller) {
      Get.offAllNamed('/sellerDashboard');
    } else {
      Get.offAllNamed(Routes.navBar);
    }
  }
}

// / ResetPasswordScreen se wapis aane ke liye
// void goBackToLogin() {
//   Get.back(); // ✅ Simple back
//   Ya
  // Get.until((route) => route.settings.name == Routes.login); // ✅ Specific screen tak back
// }