import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      decoration: InputDecoration(
        hintText: "Search food item...",
        fillColor: Color(0xFFececf8),
        filled: true,

        border: InputBorder.none,
      ),
    );
  }
}
