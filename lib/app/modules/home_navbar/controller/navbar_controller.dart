import 'package:get/get.dart';

import '../../cart/controller/cart_controller.dart';
import '../../home/controller/home_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../saved/controller/saved_controller.dart';
import '../../search/controller/search_controller.dart';

class NavBarController extends GetxController {
  var selectedIndex = 0.obs;


  void changeTab(int index) {
    selectedIndex.value = index;
  }

  void handleControllerChange(int index) {
    switch (index) {
      case 0:
        if (!Get.isRegistered<HomeController>()) Get.put(HomeController());
        break;
      case 1:
        if (!Get.isRegistered<SearchController>()) Get.put(SearchController());
        break;
      case 2:
        if (!Get.isRegistered<SavedController>()) Get.put(SavedController());
        break;
      case 3:
        if (!Get.isRegistered<CartController>()) Get.put(CartController());
        break;
      case 4:
        if (!Get.isRegistered<ProfileController>()) Get.put(ProfileController());
        break;
    }
  }}

