import 'package:get/get.dart';

import '../../../data/repsonse/status.dart';
import '../../../models/product/product_model.dart';
import '../../home/repo/home_repo.dart';

class SavedController extends GetxController {
  final HomeRepo _homeRepo = Get.find<HomeRepo>();

  var savedProducts = <ProductModel>[].obs;
  var status = Status.loading.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSavedProducts();
  }

  Future<void> fetchSavedProducts() async {
    status.value = Status.loading;

    final response = await _homeRepo.getProductsData();

    if (response.status == Status.completed && response.data != null) {
      // Filter only favorites
      savedProducts.value = response.data!.where((p) => p.isFavourite == true).toList();
      status.value = Status.completed;
    } else {
      status.value = Status.error;
    }
  }

  /// Optionally allow removing favorites directly
  void toggleSaved(int id) {
    final index = savedProducts.indexWhere((p) => p.id == id);
    if (index != -1) {
      savedProducts[index].isFavourite = false;
      savedProducts.removeAt(index);
      savedProducts.refresh();
    }
  }
}
