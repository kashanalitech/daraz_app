import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/color/color.dart';


class ShimmerTable extends StatelessWidget {
  final int itemCount;

  const ShimmerTable({super.key, required this.itemCount });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 4), // Reduced to more standard duration
      baseColor: lightGrey22,
      highlightColor: Colors.grey[100]!, // Different highlight for better effect
      child: DataTable(
        dataRowHeight: 70,
        headingRowHeight: 40,
        columns: [
          _buildShimmerColumn(),
          _buildShimmerColumn(),
          _buildShimmerColumn(),
          _buildShimmerColumn(),
          _buildShimmerColumn(),
          _buildShimmerColumn(),
          // Add more columns as needed
          // _buildShimmerColumn(100),
          // _buildShimmerColumn(80),
        ],
        rows: List.generate(
          itemCount, // Use provided rowCount or default to 3
              (index) => DataRow(
            cells: [
              _buildShimmerCell(), // First cell with different height
              _buildShimmerCell(),
              _buildShimmerCell(),
              _buildShimmerCell(),
              _buildShimmerCell(),
              _buildShimmerCell(),
              // Add more cells as needed
              // _buildShimmerCell(),
            ],
          ),
        ),
      ),
    );
  }

  DataColumn _buildShimmerColumn() {
    return DataColumn(
      label: Container(
        width: 120,
        height: 15,
        color: Colors.white,
      ),
    );
  }

  DataCell _buildShimmerCell() {
    return DataCell(
      Container(
        width: 120,
        height: 15,
        color: Colors.white,
      ),
    );
  }
}

