import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color/color.dart';


class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  // ✅ Context-free methods using GetX

  static void showCustomMenu(Offset? offset, Widget dialogWidget) {
    Get.dialog(
      _CustomMenuDialog(dialogWidget: dialogWidget),
      barrierColor: Colors.transparent,
    );
  }

  static void showDialogSheet(Widget dialogWidget, {EdgeInsets? padding}) {
    Get.dialog(
      Dialog(
        insetPadding: padding ?? EdgeInsets.zero,
        backgroundColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: dialogWidget,
      ),
      barrierDismissible: true,
    );
  }

  static void showBottomSheet(Widget dialogWidget, {bool isScrollControlled = true}) {
    Get.bottomSheet(
      Wrap(children: [dialogWidget]),
      backgroundColor: Colors.white,
      isScrollControlled: isScrollControlled,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    );
  }

  // ✅ Advanced Bottom Sheet with more control
  static void showCustomBottomSheet(
      Widget dialogWidget, {
        bool isScrollControlled = true,
        double initialChildSize = 0.5,
        double maxChildSize = 0.8,
        double minChildSize = 0.3,
      }) {
    Get.bottomSheet(
      DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        minChildSize: minChildSize,
        builder: (_, controller) {
          return dialogWidget;
        },
      ),
      backgroundColor: Colors.white,
      isScrollControlled: isScrollControlled,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
    );
  }

  // ✅ Snackbar (Additional utility)
  static void showSnackbar(String title, String message, {bool isError = false}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: isError ? Colors.red : Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// ✅ Custom Menu Dialog for showCustomMenu
class _CustomMenuDialog extends StatelessWidget {
  final Widget dialogWidget;

  const _CustomMenuDialog({required this.dialogWidget});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () => Get.back(),
              behavior: HitTestBehavior.translucent,
            ),
          ),
          Positioned(
            top: 100, // Adjust position as needed
            left: 50,  // Adjust position as needed
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: dialogWidget,
            ),
          ),
        ],
      ),
    );
  }
}