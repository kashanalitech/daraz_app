import 'package:daraz_app/app/widgets/shimmer_loading_widgets/shimmer_box.dart';
import 'package:daraz_app/app/widgets/shimmer_loading_widgets/shimmer_grid.dart';
import 'package:daraz_app/app/widgets/shimmer_loading_widgets/shimmer_list.dart';
import 'package:flutter/material.dart';

import '../../utils/enums/shimmer_list_type.dart';
import '../../utils/enums/shimmer_type.dart';
import 'circle_shimmer.dart';

class BaseShimmer extends StatelessWidget {
  final ShimmerType shimmerType;
  final ShimmerListType lisType;
  final int itemCount;
  final int gridCount;
  final double childAspectRatio;
  final double height;
  final double width;
  final bool isCircle; // New parameter for circular shimmer
  final double? radius; // Optional custom radius for circle

  const BaseShimmer({
    super.key,
    required this.shimmerType,
    this.lisType = ShimmerListType.vertical,
    this.itemCount = 1,
    this.gridCount = 1,
    this.childAspectRatio = 3,
    this.height = 50,
    this.width = 100,
    this.isCircle = false, // Default to false
    this.radius, // Optional custom radius
  });

  @override
  Widget build(BuildContext context) {
    if (isCircle) {
      return CircleShimmer(
        radius: radius ?? height / 2, // Use height/2 if radius not provided
      );
    }

    switch (shimmerType) {
      case ShimmerType.list:
        return ShimmerList(
          lisType: lisType,
          itemCount: itemCount,
        );
      case ShimmerType.box:
        return ShimmerBox(
          lisType: lisType,
          itemCount: itemCount,
          height: height,
          width: width,
        );
      case ShimmerType.grid:
        return ShimmerGrid(
          itemCount: itemCount,
          gridCount: gridCount,
          childAspectRatio: childAspectRatio,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

// New CircleShimmer subwidget
// class CircleShimmer extends StatelessWidget {
//   final double radius;
//
//   const CircleShimmer({
//     super.key,
//     required this.radius,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: Container(
//         width: radius * 2,
//         height: radius * 2,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
