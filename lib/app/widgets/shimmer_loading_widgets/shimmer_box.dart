import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/enums/shimmer_list_type.dart';

class ShimmerBox extends StatelessWidget {
  final ShimmerListType lisType;
  final int itemCount;
  final double height;
  final double width;

  const ShimmerBox({
    super.key,
    required this.lisType,
    required this.itemCount,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final children = List.generate(itemCount, (_) => _boxItem());

    return lisType == ShimmerListType.vertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            children: children,
          );
  }

  Widget _boxItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
