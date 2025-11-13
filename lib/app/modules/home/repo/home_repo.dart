import 'package:daraz_app/app/utils/constants/app_icons.dart';

import '../../../data/network/network_api_service.dart';
import '../../../data/network/network_helper.dart';
import '../../../data/repsonse/api_response.dart';
import '../../../models/product/product_model.dart';
import '../../../utils/helper/helper.dart';

  class HomeRepo {
    final NetworkApiServices _apiService;

    HomeRepo(this._apiService);

    Future<ApiResponse<List<ProductModel>>> getProductsData({
      DateTime? startDate,
      DateTime? endDate,
    }) async {
      try {
        final selected = RadioSelectionManager.getSelectedValue();
        // late final dynamic response;
        switch (selected) {
          case 0:
            return await getProductDummyData();
          case 1:
            return await getProductDummyData();

          default:
            throw Exception("Invalid data source selected");
        }
      } catch (e) {
        return ApiResponse.error("Failed to load hours:$e");
      }
    }

    Future<ApiResponse<List<ProductModel>>> getProductApi() {
      return
        NetworkHelper.handleApi<List<ProductModel>>(
          apiCall: _apiService.getApi(""),
          mapSuccess: (json) {
            final list = json is List
                ? json
                : (json as Map<String, dynamic>)['data'] as List;
            return list.map<ProductModel>((e) => ProductModel.fromJson(e))
                .toList();
          },
        );
    }

    Future<ApiResponse<List<ProductModel>>> getProductDummyData() async {
      await Future.delayed(const Duration(seconds: 1)); // simulate API delay

      return ApiResponse.completed([
        // 🖤 Black T-Shirt
        ProductModel(
          id: 1,
          name: "Regular Fit Black T-Shirt",
          description:
          "A versatile black t-shirt with a perfect regular fit for everyday wear.",
          price: 1190.0,
          image: AppIcons.fitBlack,
          fitType: "Regular Fit",
          sizes: ["S", "M", "L", "XL"],
          rating: 4.4,
          reviewCount: 42,
          productImages: [
            AppIcons.fitBlack,
            AppIcons.fitBlue,
            AppIcons.fitGreen,
          ],
          reviews: [
            ReviewModel(
              id: 1,
              userName: "John Doe",
              userImage: "assets/images/user1.jpg",
              rating: 5.0,
              comment: "Amazing quality and perfect fit!",
              reviewDate: DateTime(2024, 2, 10),
            ),
          ],
        ),

        // 💙 Blue T-Shirt
        ProductModel(
          id: 2,
          name: "Regular Fit Blue T-Shirt",
          description:
          "Comfortable cotton blue tee with a regular fit that feels great all day long.",
          price: 1150.0,
          image: AppIcons.fitBlue,
          fitType: "Regular Fit",
          sizes: ["S", "M", "L"],
          rating: 4.3,
          reviewCount: 38,
          productImages: [
            AppIcons.fitBlue,
            AppIcons.fitBlack,
            AppIcons.fitGreen,
          ],
          reviews: [
            ReviewModel(
              id: 2,
              userName: "Jane Smith",
              userImage: "assets/images/user2.jpg",
              rating: 4.0,
              comment: "Color looks nice, comfortable fabric.",
              reviewDate: DateTime(2024, 3, 1),
            ),
          ],
        ),

        // 💚 Green T-Shirt
        ProductModel(
          id: 3,
          name: "Regular Fit Green T-Shirt",
          description:
          "Soft cotton t-shirt in a stylish green color. Ideal for casual wear.",
          price: 1099.0,
          image: AppIcons.fitGreen,
          fitType: "Regular Fit",
          sizes: ["M", "L", "XL"],
          rating: 4.6,
          reviewCount: 50,
          productImages: [
            AppIcons.fitGreen,
            AppIcons.fitBlack,
            AppIcons.fitBlue,
          ],
          reviews: [
            ReviewModel(
              id: 3,
              userName: "Alex Johnson",
              userImage: "assets/images/user3.jpg",
              rating: 5.0,
              comment: "Very comfortable and nice fit.",
              reviewDate: DateTime(2024, 1, 30),
            ),
          ],
        ),

        // 👖 Brown Jeans
        ProductModel(
          id: 4,
          name: "Classic Brown Jeans",
          description:
          "Premium stretchable brown denim jeans for a stylish and durable look.",
          price: 2299.0,
          image: AppIcons.brownJeans,
          fitType: "Slim Fit",
          sizes: ["30", "32", "34", "36"],
          rating: 4.7,
          reviewCount: 60,
          productImages: [
            AppIcons.brownJeans,
            AppIcons.greyJeans,
            AppIcons.redJeans,
          ],
          reviews: [
            ReviewModel(
              id: 4,
              userName: "Sarah Wilson",
              userImage: "assets/images/user4.jpg",
              rating: 5.0,
              comment: "Perfect stretch and premium feel!",
              reviewDate: DateTime(2024, 2, 14),
            ),
          ],
        ),

        // 👖 Grey Jeans
        ProductModel(
          id: 5,
          name: "Modern Grey Jeans",
          description:
          "Slim-fit grey jeans that combine comfort with a stylish edge.",
          price: 2199.0,
          image: AppIcons.greyJeans,
          fitType: "Slim Fit",
          sizes: ["28", "30", "32", "34"],
          rating: 4.4,
          reviewCount: 47,
          productImages: [
            AppIcons.greyJeans,
            AppIcons.yellowJeans,
          ],
          reviews: [
            ReviewModel(
              id: 5,
              userName: "David Brown",
              userImage: "assets/images/user5.jpg",
              rating: 4.0,
              comment: "Nice fit and fabric, worth the price.",
              reviewDate: DateTime(2024, 3, 5),
            ),
          ],
        ),

        // 👟 Black Shoes
        ProductModel(
          id: 6,
          name: "Classic Black Shoes",
          description:
          "Elegant black shoes crafted with genuine leather for a sleek look.",
          price: 3299.0,
          image: AppIcons.blackShoes,
          fitType: "Regular",
          sizes: ["40", "41", "42", "43"],
          rating: 4.8,
          reviewCount: 82,
          productImages: [
            AppIcons.blackShoes,
            AppIcons.brownShoes,
            AppIcons.darkBlueShoes,
          ],
          reviews: [
            ReviewModel(
              id: 6,
              userName: "Emily Chen",
              userImage: "assets/images/user6.jpg",
              rating: 5.0,
              comment: "Super stylish and comfortable to wear!",
              reviewDate: DateTime(2024, 3, 15),
            ),
          ],
        ),

        // 👟 Brown Shoes
        ProductModel(
          id: 7,
          name: "Leather Brown Shoes",
          description:
          "Stylish brown shoes with soft cushioning — perfect for formal wear.",
          price: 3199.0,
          image: AppIcons.brownShoes,
          fitType: "Regular",
          sizes: ["40", "41", "42"],
          rating: 4.5,
          reviewCount: 70,
          productImages: [
            AppIcons.brownShoes,
            AppIcons.yellowShoes,
            AppIcons.orangeShoes,
          ],
          reviews: [
            ReviewModel(
              id: 7,
              userName: "Robert Taylor",
              userImage: "assets/images/user7.jpg",
              rating: 4.0,
              comment: "Looks classy, slightly tight on first wear.",
              reviewDate: DateTime(2024, 3, 20),
            ),
          ],
        ),

        // 👟 Yellow Shoes
        ProductModel(
          id: 8,
          name: "Yellow Sports Sneakers",
          description:
          "Lightweight sneakers in bold yellow for those who love to stand out.",
          price: 2599.0,
          image: AppIcons.yellowShoes,
          fitType: "Athletic",
          sizes: ["39", "40", "41", "42", "43"],
          rating: 4.2,
          reviewCount: 55,
          productImages: [
            AppIcons.yellowShoes,
            AppIcons.blueShoes,
            AppIcons.orangeShoes,
          ],
          reviews: [
            ReviewModel(
              id: 8,
              userName: "Michael Scott",
              userImage: "assets/images/user8.jpg",
              rating: 4.5,
              comment: "Super comfy and trendy sneakers!",
              reviewDate: DateTime(2024, 3, 25),
            ),
          ],
        ),
      ]);
    }
  }