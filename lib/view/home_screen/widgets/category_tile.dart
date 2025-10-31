import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;

  const CategoryTile({
    super.key,
    required this.name,
    required this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(left: 20, right: 20),
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(blurRadius: 7, offset: Offset(2, 2), color: Colors.grey),
        // ],
        color: isSelected ? Color(0xffef2b39) : Color(0xFFececf8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 50, height: 50, fit: BoxFit.contain),
          SizedBox(width: 10),
          Text(
            name,
            style: AppTextStyles.titleMedium.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
