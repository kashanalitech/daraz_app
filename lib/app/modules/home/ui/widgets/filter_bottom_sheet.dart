import 'package:daraz_app/app/utils/color/color.dart';
import 'package:daraz_app/app/utils/constants/app_constant.dart';
import 'package:daraz_app/app/utils/helper/helper_gaps.dart';
import 'package:daraz_app/app/utils/text_style/default_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_filled_button.dart';
import '../../../../widgets/validate_field.dart';
import '../../controller/home_controller.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: DefaultTextTheme.headline8(
                  context,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: black, size: 23),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          gapH10,
          Divider(color: Colors.grey[300]),
          gapH20,

          // Sort By Section
          Text(
            "Sort By",
            style: DefaultTextTheme.bodyText2(
              context,
              fontWeight: FontWeight.w600,
            ),
          ),
          gapH10,
          Row(
            children: [
              _buildSortChip("Relevance"),
              gapW8,
              _buildSortChip("Price: Low - High"),
              gapW8,
              _buildSortChip("Price: High - Low"),
            ],
          ),
          gapH20,

          // Price Range Section
          Text(
            "Price",
            style: DefaultTextTheme.bodyText2(
              context,
              fontWeight: FontWeight.w600,
            ),
          ),
          gapH10,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _buildPriceRangeField(hintText: "\$0",
                    controller: controller.minPriceController.value),
              ),
              gapW8,
              gapW8,
              Expanded(
                child: _buildPriceRangeField(
                    hintText: "\$19", controller: controller.maxPriceController
                    .value),
              ),
            ],
          ),
          gapH20,

          // Size Section
          Text(
            "Size",
            style: DefaultTextTheme.bodyText2(
              context,
              fontWeight: FontWeight.w600,
            ),
          ),
          gapH20,
          Row(
            children: [
              _buildSizeChip("S"),
              gapW8,
              _buildSizeChip("M"),
              gapW8,
              _buildSizeChip("L"),
              gapW8,
              _buildSizeChip("XL"),
            ],
          ),
          gapH30,

          // Apply Filters Button
          CustomFilledButton(
            text: "Apply Filters",
            textColor: Colors.white,
            borderColor: Colors.black,
            color: Colors.black,
            onPressed: () {
              print("Sort: ${controller.selectedSort.value} | Size: ${controller
                  .selectedSize.value}");
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Sort Chip
  Widget _buildSortChip(String text) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedSort.value == text;
        return InkWell(
          onTap: () {
            controller.selectedSort.value = text;
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 28,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              border: Border.all(
                color: isSelected ? Colors.black : Colors.grey[300]!,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                text,
                style: DefaultTextTheme.captionLarge(
                  context,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  // 🔹 Price Range Field
  Widget _buildPriceRangeField(
      {required TextEditingController controller, required String hintText}) {
    return ValidatedField(
      keyboardType: TextInputType.number,
      isIconValidation: false,
      controller: controller,
      labelText: '',
      hintText: hintText,
      required: false,
    );
  }

  // 🔹 Size Chip
  Widget _buildSizeChip(String size) {
    return Obx(() {
      final isSelected = controller.selectedSize.value == size;
      return InkWell(
        onTap: () {
          controller.selectedSize.value = size;
        },
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.transparent,
            border: Border.all(
              color: isSelected ? Colors.black : Colors.grey[300]!,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              size,
              style: DefaultTextTheme.subtitle1(
                context,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      );
    });
  }
}

