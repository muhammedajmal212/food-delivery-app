import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AppFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Color(0xFFececf8),
        borderRadius: BorderRadius.circular(12),
      ),

      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
