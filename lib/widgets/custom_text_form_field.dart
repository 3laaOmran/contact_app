import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final Function(String)? onChanged;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Required Field';
        }
        return null;
      },
      keyboardType: textInputType,
      cursorColor: const Color(0xffFFF1D4),
      style: TextStyles.font16weight400blue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyles.font16weight400blue,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffFFF1D4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Color(0xffFFF1D4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
