import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startSplashTimer();
  }

  void _startSplashTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.onboarding); // replace splash with onboarding
  }

  @override
  void onClose() {
    print("🧹 SplashController destroyed");
    super.onClose();
  }
}
