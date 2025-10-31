import 'package:flutter/material.dart';

import '../utils/color/color.dart';
import '../utils/text_style/default_text_theme.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Function(TapDownDetails)? onTapDown;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final Widget? icon;
  final Widget? endIcon;
  final Color? textColor;
  final double? fontSize;
  final bool isTextShow;
  final double? sizedBWidth;
  final bool loading;

  const CustomFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.onTapDown,
    this.color,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 6.0,
    this.borderColor,
    this.borderWidth = 1.2,
    this.icon,
    this.textColor,
    this.fontSize,
    this.endIcon,
    this.isTextShow = true,
    this.sizedBWidth,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      onTapDown: onTapDown,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: color ?? mainYellow,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor ?? fieldBorderColor,
            width: borderWidth,
          ),
        ),
        child: loading
            ? Center(child: CircularProgressIndicator(color: white,))
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: isTextShow == false ? 0 : sizedBWidth ?? 6),
            ],
            if (isTextShow)
              Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle ??

                    DefaultTextTheme.subtitle1(context,
                        color: textColor ?? textBlack),
                overflow: TextOverflow.visible, // Prevents overflow error
                softWrap: true,
              ),
            if (endIcon != null) ...[
              const SizedBox(width: 6),
              endIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
