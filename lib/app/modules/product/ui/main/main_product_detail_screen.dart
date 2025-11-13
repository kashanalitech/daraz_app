import 'package:daraz_app/app/modules/product/ui/desktop/desk_product_detail_screen.dart';
import 'package:daraz_app/app/modules/product/ui/mobile/mob_product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../utils/color/color.dart';
import '../../../../utils/helper/responsive_helper.dart';

class MainProductDetailScreen extends StatelessWidget {
  const MainProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white, body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return Responsive(
      mobile: MobProductDetailScreen(),
      desktop: DeskProductDetailScreen(),
      tablet: DeskProductDetailScreen(),
    );
  }
}
