import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/item_model.dart';
import 'package:food_delivery_app/view/home_screen/widgets/food_tile.dart';

class FoodItemGridView extends StatelessWidget {
  final List<ItemModel> foodItem;

  const FoodItemGridView({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 📏 Get the available width
        double width = constraints.maxWidth;

        // 🧮 Choose number of columns based on width
        int crossAxisCount = 2; // default for phones
        double childAspectRatio = 0.75;
        if (width > 900) {
          crossAxisCount = 5; // large desktop
          childAspectRatio = 0.75;
        } else if (width > 600) {
          crossAxisCount = 3; // tablet
          childAspectRatio = 0.75;
        }

        return GridView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            // childAspectRatio: 0.9,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
          ),
          itemCount: foodItem.length,
          itemBuilder: (context, index) {
            final item = foodItem[index];
            return FoodTile(
              name: item.name,
              image: item.image,
              price: item.price,
            );
          },
        );
      },
    );
  }
}
