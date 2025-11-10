import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color/color.dart';
import '../../utils/constants/app_constant.dart';
import '../../utils/helper/helper_gaps.dart';
import '../../utils/helper/responsive_helper.dart';


class ShimmerFourGridLoading extends StatelessWidget {
  const ShimmerFourGridLoading({super.key, this.isMobile = false});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return isMobile
        ? Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildShimmerCard(context)),
            gapW12,
            Expanded(child: _buildShimmerCard(context)),
          ],
        ),
        gapH12,
        Row(
          children: [
            Expanded(child: _buildShimmerCard(context)),
            gapW12,
            Expanded(child: _buildShimmerCard(context)),
          ],
        ),
      ],
    )
        : Row(
      children: [
        Expanded(child: _buildShimmerCard(context)),
        gapW12,
        Expanded(child: _buildShimmerCard(context)),
        gapW12,
        Expanded(child: _buildShimmerCard(context)),
        gapW12,
        Expanded(child: _buildShimmerCard(context)),
      ],
    );
  }

  Widget _buildShimmerCard(BuildContext context) {
    return Card(
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: AppConstants.defaultElevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title placeholder with different shimmer color
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 12),
            child: _buildShimmerElement(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            ),
          ),
          gapH20,
          // Count placeholder with different shimmer color
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: _buildShimmerElement(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            ),
          ),
          gapH6,
          // Change indicator placeholder with different shimmer color

          Padding(
            padding: EdgeInsets.only(
              left: Responsive.isSmallMobile(context) ? 5 : 12,
              bottom: 15,
              right: Responsive.isSmallMobile(context) ? 6 : 0,
            ),
            child: _buildShimmerElement(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerElement({
    required Color baseColor,
    required Color highlightColor,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: 100,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}