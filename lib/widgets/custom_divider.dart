import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xffFFF1D4),
      thickness: 1,
      height: 20,
    );
  }
}
