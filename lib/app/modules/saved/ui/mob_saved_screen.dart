import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/product/product_model.dart';
import '../../../utils/color/color.dart';
import '../../../utils/constants/app_constant.dart';
import '../../../utils/constants/app_icons.dart';
import '../../../utils/helper/helper_gaps.dart';
import '../../../utils/text_style/default_text_theme.dart';
import '../../../widgets/app_bar_widget.dart';
import '../../../widgets/app_icon.dart';
import '../../home/controller/home_controller.dart';
import '../controller/saved_controller.dart';

class MobSavedScreen extends StatefulWidget {
  const MobSavedScreen({super.key});

  @override
  State<MobSavedScreen> createState() => _MobSavedScreenState();
}


class _MobSavedScreenState extends State<MobSavedScreen> {
  final savedController = Get.find<SavedController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        children: [
          AppBarWidget(title: 'Saved Items'),
          gapH10,
          divider,
          gapH10,
          Obx(() {
            final products = savedController.savedProducts;
            if (products.isEmpty) {
              return _buildEmptyState();
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                // Calculate responsive crossAxisCount and aspectRatio
                final screenWidth = constraints.maxWidth;
                final crossAxisCount = _getCrossAxisCount(screenWidth);
                final aspectRatio = _getAspectRatio(screenWidth);

                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: aspectRatio,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _buildProductCard(products[index]);
                  },
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIcon(icon: AppIcons.heartIcon,size: 30),
        gapH16,
        Text(
            'No Saved Items!',
            style: DefaultTextTheme.headline5(context,fontWeight: FontWeight.w800)
        ),
        gapH8,
        Text('You do not have any saved items.\n Go to home and add some', style:DefaultTextTheme.bodyText1(context,color: darkGrey),textAlign: TextAlign.center,),
      ],
    );
  }


  int _getCrossAxisCount(double screenWidth) {
    if (screenWidth < 350) {
      return 2; // Very small screens
    } else if (screenWidth < 400) {
      return 2; // Small phones
    } else if (screenWidth < 500) {
      return 2; // Medium phones
    } else {
      return 2; // Large phones (keeping 2 for better product visibility)
    }
  }

  double _getAspectRatio(double screenWidth) {
    if (screenWidth < 350) {
      return 0.75; // Taller cards for very small screens
    } else if (screenWidth < 400) {
      return 0.80; // Slightly taller cards
    } else if (screenWidth < 450) {
      return 0.85; // Balanced aspect ratio
    } else if (screenWidth < 500) {
      return 0.90; // Wider cards
    } else {
      return 0.93; // Original aspect ratio for larger screens
    }
  }
  Widget _buildProductCard(ProductModel product) {
    return Card(
      elevation: AppConstants.defaultElevation,
      color: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Heart Icon
            Stack(
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(
                        product.image ?? 'assets/images/placeholder.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Heart Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () => savedController.toggleSaved(product.id ?? 0),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 18,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            gapH8,

            // Product Name
            Text(
              product.name ?? "Product Name",
              style: DefaultTextTheme.captionLarge(
                context,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            gapH4,

            // Price with Discount
            Row(
              children: [
                Text(
                  '\$${product.price?.toStringAsFixed(0) ?? "0"}',
                  style: DefaultTextTheme.captionLarge(
                    context,
                    fontWeight: FontWeight.w700,
                    color: darkGrey,
                  ),
                ),
                gapW4,
                if (product.price != null && product.price! > 1000)
                  Text(
                    '\$1,600',
                    style: DefaultTextTheme.captionLarge(
                      context,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),
            gapH4,

            // Rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 14),
                gapW4,
                Text(
                  '${product.rating ?? 0}',
                  style: DefaultTextTheme.caption(
                    context,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                gapW4,
                Text(
                  '(${product.reviewCount ?? 0})',
                  style: DefaultTextTheme.caption(
                    context,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
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
