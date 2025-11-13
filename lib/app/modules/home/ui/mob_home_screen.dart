import 'package:daraz_app/app/modules/home/ui/widgets/filter_bottom_sheet.dart';
import 'package:daraz_app/app/utils/color/color.dart';
import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/helper/helper_gaps.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:daraz_app/app/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repsonse/status.dart';
import '../../../models/product/product_model.dart';
import '../../../utils/constants/app_icons.dart';
import '../../../utils/enums/shimmer_list_type.dart';
import '../../../utils/enums/shimmer_type.dart';
import '../../../utils/text_style/default_text_theme.dart';
import '../../../widgets/shimmer_loading_widgets/base_shimmer.dart';
import '../controller/home_controller.dart';
import 'widgets/serach_mic_field.dart';

class MobHomeScreen extends StatefulWidget {
  const MobHomeScreen({super.key});

  @override
  State<MobHomeScreen> createState() => _MobHomeScreenState();
}

class _MobHomeScreenState extends State<MobHomeScreen> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            children: [
              // Header
              header(context),
              gapH10,

              // Search and Filter
              searchAndFilter(controller),
              gapH20,

              // Categories - Scrollable
              _buildCategoriesSection(),
              gapH20,

              // Products Grid with responsive aspect ratio
              _buildProductsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Obx(() {
      return SizedBox(
        height: 40,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            gapW8,
            _buildCategoryChip("All", 0, controller),
            gapW8,
            _buildCategoryChip("Tshirts", 1, controller),
            gapW8,
            _buildCategoryChip("Jeans", 2, controller),
            gapW8,
            _buildCategoryChip("Shoes", 3, controller),
            gapW8,
          ],
        ),
      );
    });
  }

  Widget _buildProductsGrid() {
    return Obx(() {
      if (controller.productsResponse.value.status == Status.loading) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: BaseShimmer(
            itemCount: 9,
            shimmerType: ShimmerType.grid,
            lisType: ShimmerListType.horizontal,
          ),
        );
      } else if (controller.productsResponse.value.status == Status.error) {
        return Center(
          child: Text('Error: ${controller.productsResponse.value.message}'),
        );
      } else {
        final products = controller.getFilteredProducts();
        if (products.isEmpty) {
          return Center(child: Text('No products found'));
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
      }
    });
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



  Row searchAndFilter(HomeController controller) {
    return Row(
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
              print('Search icon tapped');
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
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: AppIcon(icon: AppIcons.filterIcon, color: white, size: 18),
            ),
          ),
        ),
      ],
    );
  }

  Row header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Discover",
          style: DefaultTextTheme.headline6(
            context,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          hoverColor: Colors.transparent,
          onTap: () {
            controller.goToNotification();
          },
          child: AppIcon(
            icon: AppIcons.notificationIcon,
            size: 22,
            color: black,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(
    String title,
    int index,
    HomeController controller,
  ) {
    final isSelected = controller.selectedCategoryIndex.value == index;
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        controller.selectedCategoryIndex.value = index;
      },
      child: Container(
        alignment: Alignment.center,
        height: 15,
        width: 80,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? black : Colors.transparent,
          border: Border.all(
            color: isSelected ? black : Colors.grey[300]!,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: DefaultTextTheme.bodyText2(
            context,
            fontWeight: FontWeight.w500,
            color: isSelected ? white : black,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(ProductModel product) {
    return InkWell(
      onTap: () {
        controller.goToProductDetail(product);
      },

      child: Card(
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
                      onTap: () {
                        // Toggle favorite status
                        controller.toggleProductFavorite(product.id ?? 0);
                      },
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
                          product.isFavourite ?? false
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 18,
                          color: product.isFavourite ?? false
                              ? Colors.red
                              : Colors.grey[600],
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
      ),
    );
  }
}
