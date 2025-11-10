import 'package:daraz_app/app/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repsonse/api_response.dart';
import '../../../data/repsonse/status.dart';
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
      if (product == null) return false;

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

  void toggleProductFavorite(int productId) {
    final products = productsResponse.value.data ?? [];
    final productIndex = products.indexWhere((p) => p?.id == productId);

    if (productIndex != -1 && products[productIndex] != null) {
      // Use the getter or handle null safely
      final currentProduct = products[productIndex]!;

      // Toggle the favorite status safely
      if (currentProduct.isFavourite == null) {
        currentProduct.isFavourite = true; // Set to true if null
      } else {
        currentProduct.isFavourite = !currentProduct.isFavourite!;
      }

      // Update the reactive list
      productsResponse.refresh();
    }
  }
  // Add method to change category
  void changeCategory(int index) {
    selectedCategoryIndex.value = index;
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