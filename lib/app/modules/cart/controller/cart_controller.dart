import 'package:get/get.dart';

class CartController extends GetxController {

  @override
  void onClose() {
    print("🧹 CartController destroyed");
    super.onClose();
  }
}