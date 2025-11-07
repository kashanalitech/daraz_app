import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  String? image;
  String? fitType; // "Regular Fit", "Slim Fit", etc.
  List<String>? sizes; // Available sizes like ["S", "M", "L"]
  List<ReviewModel>? reviews;
  double? rating;
  int? reviewCount;
  List<String>? productImages; // Multiple product images

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.fitType,
    this.sizes,
    this.reviews,
    this.rating,
    this.reviewCount,
    this.productImages,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ReviewModel {
  int? id;
  String? userName;
  String? userImage;
  double? rating; // Star rating (1.0 to 5.0)
  String? comment;
  DateTime? reviewDate;
  // List<String>? reviewImages;

  ReviewModel({
    this.id,
    this.userName,
    this.userImage,
    this.rating,
    this.comment,
    this.reviewDate,
    // this.reviewImages,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  // Helper method to get star rating as integer for UI
  int get starRating => rating?.round() ?? 0;


}