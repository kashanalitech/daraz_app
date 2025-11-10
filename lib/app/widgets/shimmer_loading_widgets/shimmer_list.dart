import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/enums/shimmer_list_type.dart';


class ShimmerList extends StatelessWidget {
  final ShimmerListType lisType;
  final int itemCount;

  const ShimmerList({
    super.key,
    required this.lisType,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: lisType == ShimmerListType.horizontal
          ? Row(
        children: List.generate(
          itemCount,
              (index) => _shimmerItem(padding: const EdgeInsets.only(right: 12)),
        ),
      )
          : Column(
        children: List.generate(
          itemCount,
              (index) => _shimmerItem(padding: const EdgeInsets.only(bottom: 12)),
        ),
      ),
    );
    // return direction == ShimmerListType.vertical
    //     ? ListView.builder(
    //   itemCount: itemCount,
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   itemBuilder: (_, index) => _shimmerTile(),
    // )
    //     : SizedBox(
    //   height: 120,
    //   child: ListView.builder(
    //     itemCount: itemCount,
    //     scrollDirection: Axis.horizontal,
    //     shrinkWrap: true,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (_, index) => Padding(
    //       padding: const EdgeInsets.only(right: 12),
    //       child: _shimmerTile(width: 100),
    //     ),
    //   ),
    // );
  }

  Widget _shimmerItem({EdgeInsets padding = EdgeInsets.zero}) {
    return Padding(
      padding: padding,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _shimmerTile({double? width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: width ?? double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

