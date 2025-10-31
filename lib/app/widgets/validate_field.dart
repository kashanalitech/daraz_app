import 'package:daraz_app/app/utils/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/text_style/default_text_theme.dart';

class ValidatedField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? prefixTxt;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool required;
  final bool isNameField;
  final bool allowSpecialChars;
  final int? minLength;
  final int? maxLength;
  final double height;
  final String? successIcon;
  final String? errorIcon;
  final String? suffixIcon;
  final void Function(String)? onChanged;
  final bool readOnly;

  const ValidatedField({
    Key? key,
    required this.labelText,
    this.hintText,
    this.prefixTxt,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.required = false,
    this.isNameField = false,
    this.allowSpecialChars = false,
    this.minLength,
    this.maxLength,
    this.height = 45,
    this.successIcon,
    this.errorIcon,
    this.suffixIcon,
    this.onChanged,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<ValidatedField> createState() => _ValidatedFieldState();
}

class _ValidatedFieldState extends State<ValidatedField> {
  String? _errorText;
  bool _isValid = false;
  bool _touched = false;
  bool _obscure = true; // 👁️ for password toggle

  void _validate(String value) {
    setState(() {
      _touched = true;

      if (widget.required && value.isEmpty) {
        _errorText = 'This field is required';
        _isValid = false;
        return;
      }

      if (widget.minLength != null && value.length < widget.minLength!) {
        _errorText = 'Must be at least ${widget.minLength} chars';
        _isValid = false;
        return;
      }

      if (widget.maxLength != null && value.length > widget.maxLength!) {
        _errorText = 'Cannot exceed ${widget.maxLength} chars';
        _isValid = false;
        return;
      }

      if (widget.keyboardType == TextInputType.emailAddress &&
          !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
        _errorText = 'Invalid email format';
        _isValid = false;
        return;
      }

      if (widget.keyboardType == TextInputType.visiblePassword &&
          value.length < 6) {
        _errorText = 'Password too short';
        _isValid = false;
        return;
      }

      if (widget.keyboardType == TextInputType.number &&
          double.tryParse(value) == null) {
        _errorText = 'Please enter a valid number';
        _isValid = false;
        return;
      }

      if (widget.isNameField &&
          !widget.allowSpecialChars &&
          !RegExp(r"^[a-zA-ZÀ-úÀ-ÚñÑüÜ'\-\s]+$").hasMatch(value)) {
        _errorText = 'Only letters and spaces allowed';
        _isValid = false;
        return;
      }

      _errorText = null;
      _isValid = true;
    });

    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Widget? suffix;

    if (!_touched) {
      borderColor = Colors.grey.shade300;
    } else if (_isValid) {
      borderColor = Colors.green;
      suffix = widget.successIcon != null
          ? SvgPicture.asset(widget.successIcon!, color: Colors.green, height: 18)
          : const Icon(Icons.check_circle, color: Colors.green, size: 20);
    } else {
      borderColor = Colors.red;
      suffix = widget.errorIcon != null
          ? SvgPicture.asset(widget.errorIcon!, color: Colors.red, height: 18)
          : const Icon(Icons.cancel, color: Colors.red, size: 20);
    }

    // 👁️ Add show/hide toggle for password fields
    final isPasswordField =
        widget.obscureText || widget.keyboardType == TextInputType.visiblePassword;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText,
            style: DefaultTextTheme.subtitle1(context,color: mediumBlack),),
        const SizedBox(height: 6),
        SizedBox(
          height: widget.height,
          child: TextFormField(style: const TextStyle(color: Colors.black, fontSize: 13),
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: isPasswordField ? _obscure : false,
            readOnly: widget.readOnly,
            onChanged: _validate,
            decoration: InputDecoration(
              prefixText: widget.prefixTxt,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
              suffixIcon: isPasswordField
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_touched)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: suffix,
                    ),
                  IconButton(
                    icon: Icon(
                      _obscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () => setState(() {
                      _obscure = !_obscure;
                    }),
                  ),
                ],
              )
                  : suffix,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              _errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}

