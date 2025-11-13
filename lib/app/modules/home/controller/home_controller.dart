import 'package:daraz_app/app/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repsonse/api_response.dart';
import '../../../data/repsonse/status.dart';
import '../../../routes/app_routes.dart';
import '../../saved/controller/saved_controller.dart';
import '../repo/home_repo.dart';

class HomeController extends GetxController {
  final HomeRepo _repo = Get.find<HomeRepo>();

  // Fix: Change from List<ProductModel?> to List<ProductModel>
  var productsResponse = ApiResponse<List<ProductModel>>(Status.loading, null, null).obs;

  final searchController = TextEditingController().obs;
  final minPriceController = TextEditingController().obs;
  final maxPriceController = TextEditingController().obs;
  RxString selectedSort = "Relevance".obs;
  RxString selectedSize = "L".obs;

  // Add category management
  var selectedCategoryIndex = 0.obs;
  var categories = ["All", "Tshirts", "Jeans", "Shoes"];

  @override
  void onInit() {
    fetchProductsData();
    getFilteredProducts();
    super.onInit();
  }

  Future<void> fetchProductsData() async {
    productsResponse.value = ApiResponse.loading();
    var response = await _repo.getProductsData();
    productsResponse.value = response;
  }

  // Add filtered products method
  List<ProductModel> getFilteredProducts() {
    final allProducts = productsResponse.value.data ?? [];

    // Return all products if "All" category is selected
    if (selectedCategoryIndex.value == 0) return allProducts;

    final category = categories[selectedCategoryIndex.value];

    return allProducts.where((product) {
      // Filter out null products (shouldn't happen with proper API response)
      final productName = product.name?.toLowerCase() ?? '';

      if (category == "Tshirts") {
        return productName.contains("tshirt") ||
            productName.contains("t-shirt") ||
            productName.contains("shirt");
      } else if (category == "Jeans") {
        return productName.contains("jeans") ||
            productName.contains("denim");
      } else if (category == "Shoes") {
        return productName.contains("shoes") ||
            productName.contains("sneakers") ||
            productName.contains("footwear");
      }
      return false;
    }).toList();
  }

  /// ✅ Toggle favorite (purely local)
  void toggleProductFavorite(int productId) {
    final products = productsResponse.value.data ?? [];
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      products[index].isFavourite = !(products[index].isFavourite ?? false);
      productsResponse.refresh();
    }
  }  // Add method to change category
  void changeCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void goToNotification() {
    Get.toNamed(Routes.notification); // ✅ Navigate & clear history
  }

  void goToProductDetail(ProductModel product) {
    Get.toNamed(
      Routes.productDetail,
      arguments: product,
    );
  }


  @override
  void onClose() {
    searchController.value.dispose();
    minPriceController.value.dispose();
    maxPriceController.value.dispose();
    print("🧹 HomeController destroyed");
    super.onClose();
  }
}