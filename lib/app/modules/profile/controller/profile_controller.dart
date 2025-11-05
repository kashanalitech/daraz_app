import 'package:get/get.dart';

class ProfileController extends GetxController {

  @override
  void onClose() {
    print("🧹 ProfileController destroyed");
    super.onClose();
  }
}