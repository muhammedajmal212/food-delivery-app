import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/presentation/screens/home_screen/widgets/category_tile.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryModel> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategoryListView({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () => onCategorySelected(index),
            child: CategoryTile(
              name: category.name,
              image: category.image,
              isSelected: selectedIndex == index,
            ),
          );
        },
      ),
    );
  }
}
