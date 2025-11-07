import 'package:daraz_app/app/modules/home_navbar/ui/widgets/custom_bottom_nav_item.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constants/app_icons.dart';
import '../../cart/controller/cart_controller.dart';
import '../../cart/ui/main_cart_screen.dart';
import '../../home/controller/home_controller.dart';
import '../../home/ui/main_home_screen.dart';
import '../../profile/controller/profile_controller.dart';
import '../../profile/ui/main/main_profile_screen.dart';
import '../../saved/controller/saved_controller.dart';
import '../../saved/ui/main_saved_screen.dart';
import '../../search/ui/main_search_screen.dart';
import '../controller/navbar_controller.dart';


class NavbarShell extends StatelessWidget {
  const NavbarShell({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavBarController());

    final pages = [
      const MainHomeScreen(),
      const MainSearchScreen(),
      const MainSavedScreen(),
      const MainCartScreen(),
      const MainProfileScreen(),
    ];

    // ✅ Pehle tab (Home) ka controller load karo
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }

    return Obx(() {
      // ✅ Handle controller switching jab tab change ho
      _handleControllerChange(controller.selectedIndex.value);

      return Scaffold(
        backgroundColor: white,
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: lightGrey, blurRadius: 8, offset: const Offset(0, -2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavItem(
                icon: AppIcons.homeIcon,
                label: "Home",
                isSelected: controller.selectedIndex.value == 0,
                onTap: () => controller.changeTab(0),
              ),
              CustomBottomNavItem(
                icon: AppIcons.searchIcon,
                label: "Search",
                isSelected: controller.selectedIndex.value == 1,
                onTap: () => controller.changeTab(1),
              ),
              CustomBottomNavItem(
                icon: AppIcons.heartIcon,
                label: "Saved",
                isSelected: controller.selectedIndex.value == 2,
                onTap: () => controller.changeTab(2),
              ),
              CustomBottomNavItem(
                icon: AppIcons.cartIcon,
                label: "Cart",
                isSelected: controller.selectedIndex.value == 3,
                onTap: () => controller.changeTab(3),
              ),
              CustomBottomNavItem(
                icon: AppIcons.profileIcon,
                label: "Profile",
                isSelected: controller.selectedIndex.value == 4,
                onTap: () => controller.changeTab(4),
              ),
            ],
          ),
        ),
      );
    });
  }

  // ✅ Controller create/delete handle function
  void _handleControllerChange(int index) {
    // Pehle sab delete karo except current screen ka
    if (Get.isRegistered<HomeController>() && index != 0) Get.delete<HomeController>();
    if (Get.isRegistered<SearchController>() && index != 1) Get.delete<SearchController>();
    if (Get.isRegistered<SavedController>() && index != 2) Get.delete<SavedController>();
    if (Get.isRegistered<CartController>() && index != 3) Get.delete<CartController>();
    if (Get.isRegistered<ProfileController>() && index != 4) Get.delete<ProfileController>();

    // Ab naya controller load karo
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
  }
}
