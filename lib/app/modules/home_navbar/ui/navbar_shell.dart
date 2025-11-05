import 'package:daraz_app/app/modules/home_navbar/ui/widgets/custom_bottom_nav_item.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constants/app_icons.dart';
import '../../cart/ui/main_cart_screen.dart';
import '../../home/ui/main_home_screen.dart';
import '../../profile/ui/main/main_profile_screen.dart';
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

    return Obx(() {
      return Scaffold(
        backgroundColor: white,
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: lightGrey, blurRadius: 8, offset: Offset(0, -2)),
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
}
