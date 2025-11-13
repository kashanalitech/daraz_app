import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/helper/helper_gaps.dart';
import 'package:daraz_app/app/utils/text_style/default_text_theme.dart';
import 'package:daraz_app/app/widgets/app_bar_widget.dart';
import 'package:daraz_app/app/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/product/product_model.dart';
import '../../../../utils/color/color.dart';
import '../../../home/controller/home_controller.dart';

class MobProductDetailScreen extends StatefulWidget {
  MobProductDetailScreen({super.key});

  @override
  State<MobProductDetailScreen> createState() => _MobProductDetailScreenState();
}

class _MobProductDetailScreenState extends State<MobProductDetailScreen> {
  final HomeController controller = Get.find<HomeController>();
  late final ProductModel product = Get.arguments as ProductModel;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar
                AppBarWidget(title: "Details"),
                gapH20,

                // Product Image with Heart Button
                Stack(
                  children: [
                    Container(
                      height: 300,
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
                    Positioned(
                      top: 8,
                      right: 8,
                      child: InkWell(
                        onTap: () {
                          controller.toggleProductFavorite(product.id ?? 0);
                          setState(() {}); // Force rebuild
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                            product.isFavourite == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 23,
                            color: product.isFavourite == true
                                ? Colors.red
                                : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                gapH20,

                // Product Title
                Text(
                  product.name ?? 'Product Name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                gapH10,

                // Rating and Reviews
                Row(
                  children: [
                    // Star Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        SizedBox(width: 4),
                        Text(
                          '${product.rating ?? 4.0}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8),
                    // Reviews Count
                    Text(
                      '(${product.reviewCount ?? 45} reviews)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                gapH20,

                // Fit Type
                Text(
                  product.fitType ?? 'Regular Fit Slogan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                gapH10,

                // Description
                Text(
                  product.description ??
                      'The name says it all, the right size slightly snugs the body leaving enough room for comfort in the sleeves and waist.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                gapH20,

                // Choose Size Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose size',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    gapH10,

                    // Size Selection Buttons
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: (product.sizes ?? ['S', 'M', 'L']).map((size) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              color: selectedSize == size
                                  ? Colors.black
                                  : Colors.transparent,
                              border: Border.all(
                                color: selectedSize == size
                                    ? Colors.black
                                    : Colors.grey[400]!,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                size,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: selectedSize == size
                                      ? Colors.white
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                gapH30,

                // Price and Add to Cart Button
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${product.price ?? 1190}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),

                      CustomFilledButton(
                        text: "Add to Cart",
                        textColor: Colors.white,
                        borderColor: Colors.black,
                        color: Colors.black,
                        onPressed: () {
                          // controller.goToVerification();
                        },
                      ),
                      // Add to Cart Button
                      // Expanded(
                      //   child: Container(
                      //     margin: EdgeInsets.only(left: 20),
                      //     height: 50,
                      //     child: ElevatedButton(
                      //       onPressed: () {
                      //         if (selectedSize == null) {
                      //           // Show error if no size selected
                      //           Get.snackbar(
                      //             'Size Required',
                      //             'Please select a size before adding to cart',
                      //             backgroundColor: Colors.white,
                      //             colorText: Colors.black,
                      //           );
                      //           return;
                      //         }
                      //         // Add to cart logic here
                      //         // controller.addToCart(product, selectedSize!);
                      //         Get.snackbar(
                      //           'Success',
                      //           'Product added to cart',
                      //           backgroundColor: Colors.green,
                      //           colorText: Colors.white,
                      //         );
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.black,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //         elevation: 2,
                      //       ),
                      //       child: Text(
                      //         'Add to Cart',
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w600,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
