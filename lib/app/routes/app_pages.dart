import 'package:daraz_app/app/modules/auth/controller/forgot_password_controller.dart';
import 'package:daraz_app/app/modules/auth/controller/reset_password_controller.dart';
import 'package:daraz_app/app/modules/auth/controller/verification_controller.dart';
import 'package:daraz_app/app/modules/auth/ui/main/main_forgot_password_screen.dart';
import 'package:daraz_app/app/modules/auth/ui/main/main_login_screen.dart';
import 'package:daraz_app/app/modules/auth/ui/main/main_reset_password_screen.dart';
import 'package:daraz_app/app/modules/auth/ui/main/main_verification_screen.dart';
import 'package:daraz_app/app/modules/home/controller/home_controller.dart';
import 'package:daraz_app/app/modules/home/ui/main_home_screen.dart';
import 'package:daraz_app/app/modules/onboarding/ui/main_on_boarding_screen.dart';
import 'package:get/get.dart';
import '../modules/auth/controller/login_controller.dart';
import '../modules/onboarding/controller/on_boarding_controller.dart';
import '../modules/splash/controller/splash_controller.dart';
import '../modules/splash/ui/main_splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    // Splash Screen
    GetPage(
      name: Routes.splash,
      page: () => const MainSplashScreen(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),

    // Onboarding Screen
    GetPage(
      name: Routes.onboarding,
      page: () => const MainOnBoardingScreen(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
    ),
    GetPage(
      name: Routes.login,
      page: () => const MainLoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: Routes.home,
      page: () => const MainHomeScreen(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const MainForgotPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.put(ForgotPasswordController());
      }),
    ),

    GetPage(
      name: Routes.verification,
      page: () => const MainVerificationScreen(),
      binding: BindingsBuilder(() {
        Get.put(VerificationController());
      }),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const MainResetPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.put(ResetPasswordController());
      }),
    ),
  ];
}
