import 'package:daraz_app/app/modules/notification/repo/notification_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/network/network_api_service.dart';
import '../data/user_prefernce/user_prefrence_view_model.dart';
import '../modules/home/repo/home_repo.dart';

class Locator {
  static Future<void> init() async {
    //MAIN REPO
    // Get.put<MainRepo>(MainRepo(Get.find<NetworkApiServices>()), permanent: true);

    // Register UserPreference as a singleton
    Get.put<UserPreference>(UserPreference(), permanent: true);

    // Register NetworkApiServices as a singleton
    Get.put<NetworkApiServices>(NetworkApiServices(), permanent: true);

    // Register LoginScreenRepo as a singleton
    Get.put<HomeRepo>(HomeRepo(Get.find<NetworkApiServices>()), permanent: true);
    Get.put<NotificationRepo>(NotificationRepo(Get.find<NetworkApiServices>()), permanent: true);
  }
}
