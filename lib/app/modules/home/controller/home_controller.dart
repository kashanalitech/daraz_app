import 'package:daraz_app/app/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repsonse/api_response.dart';
import '../../../data/repsonse/status.dart';
import '../repo/home_repo.dart';

class HomeController extends GetxController {
  final HomeRepo _repo = Get.find<HomeRepo>();
  var productsResponse = ApiResponse<List<ProductModel?>>(
    Status.loading,
    null,
    null,
  ).obs;

  final searchController = TextEditingController().obs;
  final minPriceController = TextEditingController().obs;
  final maxPriceController = TextEditingController().obs;
  RxString selectedSort = "Relevance".obs;

  RxString selectedSize = "L".obs;

  Future<void> fetchProductsData() async {
    productsResponse.value = ApiResponse.loading();
    var response = await _repo.getProductsData();
    productsResponse.value = response;
  }

  @override
  void onClose() {
    print("🧹 HomeController destroyed");
    super.onClose();
  }
}
