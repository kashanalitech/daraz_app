// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  image: json['image'] as String?,
  fitType: json['fitType'] as String?,
  isFavourite: json['isFavourite'] as bool?,
  sizes: (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList(),
  reviews: (json['reviews'] as List<dynamic>?)
      ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  rating: (json['rating'] as num?)?.toDouble(),
  reviewCount: (json['reviewCount'] as num?)?.toInt(),
  productImages: (json['productImages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'isFavourite': instance.isFavourite,
      'price': instance.price,
      'image': instance.image,
      'fitType': instance.fitType,
      'sizes': instance.sizes,
      'reviews': instance.reviews,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'productImages': instance.productImages,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: (json['id'] as num?)?.toInt(),
  userName: json['userName'] as String?,
  userImage: json['userImage'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  comment: json['comment'] as String?,
  reviewDate: json['reviewDate'] == null
      ? null
      : DateTime.parse(json['reviewDate'] as String),
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'rating': instance.rating,
      'comment': instance.comment,
      'reviewDate': instance.reviewDate?.toIso8601String(),
    };
