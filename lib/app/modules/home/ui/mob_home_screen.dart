import 'package:daraz_app/app/modules/home/ui/widgets/filter_bottom_sheet.dart';
import 'package:daraz_app/app/utils/color/color.dart';
import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/helper/helper_gaps.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:daraz_app/app/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app_icons.dart';
import '../../../utils/text_style/default_text_theme.dart';
import '../controller/home_controller.dart';
import 'widgets/serach_mic_field.dart';

class MobHomeScreen extends StatelessWidget {
  const MobHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discover",
                  style: DefaultTextTheme.headline6(
                    context,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                AppIcon(
                  icon: AppIcons.notificationIcon,
                  size: 22,
                  color: black,
                ),
              ],
            ),
            gapH10,
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: SearchMicField(
                    controller: controller.searchController.value,
                    hintText: "Search for clothes....",
                    onSubmitted: (q) {
                      print('Search: $q');
                    },
                    onSearchTap: () {
                      print('Search icon tapped'); // optional
                    },
                    onMicPressed: () {
                      print('Mic pressed — start voice capture');
                    },
                  ),
                ),
                gapW6,
                Expanded(
                  child: InkWell(
                    onTap: () {
                      CustomDialog.showBottomSheet(FilterBottomSheet());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: AppIcon(
                        icon: AppIcons.filterIcon,
                        color: white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
