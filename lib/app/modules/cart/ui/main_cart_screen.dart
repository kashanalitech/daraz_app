import 'package:daraz_app/app/modules/cart/ui/desk_cart_screen.dart';
import 'package:daraz_app/app/modules/cart/ui/mob_cart_screen.dart';
import 'package:daraz_app/app/utils/color/color.dart';
import 'package:flutter/material.dart';

import '../../../utils/helper/responsive_helper.dart';

class MainCartScreen extends StatelessWidget {
  const MainCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: white,
      body: Column(children: [isMobile ? MobCartScreen() : DeskCartScreen()]),
    );
  }
}
