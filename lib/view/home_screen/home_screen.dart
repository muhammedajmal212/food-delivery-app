import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';
import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/model/item_model.dart';
import 'package:food_delivery_app/service/catetegory_service.dart';
import 'package:food_delivery_app/service/item_service.dart';
import 'package:food_delivery_app/view/home_screen/widgets/category_list_view.dart';
import 'package:food_delivery_app/view/home_screen/widgets/food_item_grid_view.dart';
import 'package:food_delivery_app/view/home_screen/widgets/search_form_field.dart';
import 'package:food_delivery_app/view/home_screen/widgets/search_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  late List<CategoryModel> categories = [];
  late List<ItemModel> pizza = [];
  late List<ItemModel> burger = [];
  late List<ItemModel> chinese = [];
  late List<ItemModel> mexican = [];

  @override
  void initState() {
    categories = CatetegoryService().getCategories();
    pizza = ItemService().getPizza();
    burger = ItemService().getburger();
    chinese = ItemService().getChinease();
    mexican = ItemService().getMexicanFoodItems();
    super.initState();
  }

  List<ItemModel> getSelectedItems() {
    switch (selectedCategoryIndex) {
      case 0:
        return pizza;
      case 1:
        return burger;
      case 2:
        return chinese;
      case 3:
        return mexican;

      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedItems = getSelectedItems();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
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
                    padding: EdgeInsets.only(right: 20),
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
              SizedBox(height: 10),
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
                    SizedBox(width: 10),
                    SearchIcon(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 70,
                child: CategoryListView(
                  categories: categories,
                  selectedIndex: selectedCategoryIndex,
                  onCategorySelected: (index) {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(child: FoodItemGridView(foodItem: selectedItems)),
            ],
          ),
        ),
      ),
    );
  }
}
