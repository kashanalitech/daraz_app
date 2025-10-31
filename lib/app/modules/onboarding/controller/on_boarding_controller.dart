import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {



  void goToLogin() {
    Get.offAllNamed(Routes.login); // ✅ Navigate & clear history
  }

  @override
  void onClose() {
    print("🧹 OnboardingController destroyed");
    super.onClose();
  }
}
