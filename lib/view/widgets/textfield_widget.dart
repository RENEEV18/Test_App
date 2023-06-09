import 'package:flutter/material.dart';
import 'package:test_app/utils/colors/colors.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.contentPadding,
    this.hintStyle,
    this.validator,
    this.controller,
    required this.obscureText,
    this.errorStyle,
    this.keyboardType,
    this.onChanged,
  });
  final String? hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextStyle? errorStyle;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.kWhite.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: AppColors.kTextformColor,
          errorStyle: errorStyle,
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding: contentPadding,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
