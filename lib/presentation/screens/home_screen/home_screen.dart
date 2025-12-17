import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';
import 'package:food_delivery_app/presentation/providers/home_provider.dart';
import 'package:food_delivery_app/presentation/screens/home_screen/widgets/category_list_view.dart';
import 'package:food_delivery_app/presentation/screens/home_screen/widgets/food_item_grid_view.dart';
import 'package:food_delivery_app/presentation/screens/home_screen/widgets/search_form_field.dart';
import 'package:food_delivery_app/presentation/screens/home_screen/widgets/search_icon.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 110,
                      ),
                      Text(
                        "Order your favourite foods!",
                        style: AppTextStyles.labelLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/boy.jpg",
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Search bar
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SearchFormField(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SearchIcon(),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Categories
              SizedBox(
                height: 70,
                child: CategoryListView(
                  categories: provider.categories,
                  selectedIndex: provider.selectedCategoryIndex,
                  onCategorySelected: (index) {
                    context.read<HomeProvider>().updateSelectedCategory(index);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // Food items
              Expanded(
                child: FoodItemGridView(foodItem: provider.selectedItems),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
