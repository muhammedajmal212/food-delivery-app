import 'package:flutter/material.dart';
import 'package:food_delivery_app/infrastructure/controllers/home_controller.dart';
import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/model/item_model.dart';

class HomeProvider with ChangeNotifier {
  final HomeController controller;
  HomeProvider({required this.controller}) {
    _initData();
  }
  int selectedCategoryIndex = 0;
  List<CategoryModel> categories = [];
  List<ItemModel> pizza = [];
  List<ItemModel> burger = [];
  List<ItemModel> chinese = [];
  List<ItemModel> mexican = [];

  void updateSelectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void selectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void _initData() {
    categories = controller.getCategory();
    pizza = controller.getPizza();
    burger = controller.getBurger();
    chinese = controller.chinese();
    mexican = controller.getMexican();
  }

  List<ItemModel> get selectedItems {
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
}
