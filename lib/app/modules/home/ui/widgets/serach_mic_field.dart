import 'package:daraz_app/app/utils/color/color.dart';
import 'package:daraz_app/app/utils/constants/app_icons.dart';
import 'package:daraz_app/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class SearchMicField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onSubmitted;
  final VoidCallback? onMicPressed;
  final VoidCallback? onSearchTap; // agar aap search icon ko tappable rakhna chahein
  final bool enabled;

  const SearchMicField({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.onSubmitted,
    this.onMicPressed,
    this.onSearchTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14),
        // prefix: search icon (touchable if onSearchTap provided)
        prefixIcon: GestureDetector(
          onTap: onSearchTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: AppIcon(icon: AppIcons.searchIcon,size: 17)
          ),
        ),
        // suffix: mic icon as button
        suffixIcon: IconButton(
          icon: Icon(Icons.mic_none_outlined, size: 22,color: Colors.grey.shade400,),
          onPressed: onMicPressed,
          tooltip: 'Voice input',
        ),
        // Outline border (normal)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        // Outline border (focused)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        // Outline border (error)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        filled: false,
        fillColor: Colors.white,
      ),
    );
  }
}
