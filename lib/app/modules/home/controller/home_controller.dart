import 'package:get/get.dart';

class HomeController extends GetxController{

  @override
  void onClose() {
    print("🧹 HomeController destroyed");
    super.onClose();
  }
}