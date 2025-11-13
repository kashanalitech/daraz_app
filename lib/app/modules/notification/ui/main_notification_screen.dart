import 'package:daraz_app/app/modules/home/ui/desk_home_screen.dart';
import 'package:daraz_app/app/modules/notification/ui/mob_notification_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/color/color.dart';
import '../../../utils/helper/responsive_helper.dart';
import 'desk_notification_screen.dart';

  class MainNotificationScreen extends StatelessWidget {
  const MainNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white, body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Responsive(
      mobile: MobNotificationScreen(),
      desktop: DeskNotificationScreen(),
      tablet: DeskNotificationScreen(),
    );
  }
}
