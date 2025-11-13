import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/text_style/default_text_theme.dart';
import 'package:daraz_app/app/widgets/app_bar_widget.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repsonse/status.dart';
import '../../../models/notification/notification_model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constants/app_icons.dart';
import '../../../utils/enums/shimmer_list_type.dart';
import '../../../utils/enums/shimmer_type.dart';
import '../../../utils/helper/helper_gaps.dart';
import '../../../widgets/shimmer_loading_widgets/base_shimmer.dart';
import '../controller/notification_controller.dart';

class MobNotificationScreen extends StatefulWidget {
  const MobNotificationScreen({super.key});

  @override
  State<MobNotificationScreen> createState() => _MobNotificationScreenState();
}

class _MobNotificationScreenState extends State<MobNotificationScreen> {
  final NotificationController controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarWidget(title: 'Notifications'),
            gapH10,
            divider,
            Obx(() {
              final status = controller.notificationsResponse.value.status;
              final notifications = controller.notificationsResponse.value.data ?? [];

              if (status == Status.loading) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: BaseShimmer(
                    itemCount: 8,
                    height: 20,
                    width: double.infinity,
                    shimmerType: ShimmerType.list,
                    lisType: ShimmerListType.vertical,
                  ),
                );
              } else if (status == Status.error) {
                return Center(
                  child: Text('Error: $status'),
                );
              } else if (notifications.isEmpty) {
                return _buildEmptyState();
              } else {
                return _buildNotificationsList(notifications);
              }
            }),
          ],
        ),
      ),
    );
  }



  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(icon: AppIcons.notificationIcon,size: 30),
          gapH16,
          Text(
            'No Notifications',
            style: DefaultTextTheme.headline5(context,fontWeight: FontWeight.w800)
          ),
          gapH8,
          Text('You\'re all caught up!', style:DefaultTextTheme.bodyText1(context,color: darkGrey)),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(List<NotificationModel> notifications) {
    return Obx(() {
      final grouped = controller.groupedNotifications;

      if (grouped.isEmpty) return _buildEmptyState();

      final headings = grouped.keys.toList();

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: headings.length,
        itemBuilder: (context, index) {
          final heading = headings[index];
          final items = grouped[heading]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🗓️ Heading (like Today / Yesterday / etc)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  heading,
                  style: DefaultTextTheme.bodyText1(
                    context,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              gapH10,

              // 🔔 Notifications under this heading
              ...items.asMap().entries.map((entry) {
                final i = entry.key;
                final n = entry.value;
                final isLastItem = i == items.length - 1;
                final isLastGroup = index == headings.length - 1;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: _buildNotificationItem(n),
                    ),

                    // Divider logic 👇
                    if (isLastItem && !isLastGroup)
                     divider,
                  ],
                );
              }),
            ],
          );
        },
      );
    });
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 🔘 Icon on left
        Padding(
          padding: const EdgeInsets.only(top: 3.0, right: 10),
          child: Icon(
            _getIconData(notification.icon),
            // color: Colors.black,
            size: 18,
          ),
        ),

        // 📝 Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.title ?? '',
                style: DefaultTextTheme.bodyText1(context,fontWeight: FontWeight.w700)
              ),
              SizedBox(height: 4),
              Text(
                notification.description ?? '',
                style: DefaultTextTheme.captionLarge(context,color: darkGrey)
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'local_offer':
        return Icons.local_offer_outlined;
      case 'account_balance_wallet':
        return Icons.account_balance_wallet_outlined;
      case 'track_changes':
        return Icons.track_changes_outlined;
      case 'credit_card':
        return Icons.credit_card_outlined;
      case 'person':
        return Icons.person_outline;
      case 'local_shipping':
        return Icons.local_shipping_outlined;
      case 'payment':
        return Icons.payment_outlined;
      default:
        return Icons.notifications_none_outlined;
    }
  }

}
