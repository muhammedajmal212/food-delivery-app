import 'package:food_delivery_app/model/category_model.dart';

class CatetegoryService {
  List<CategoryModel> getCategories() {
    List<CategoryModel> category = [
      CategoryModel(name: "Pizza", image: "assets/images/pizza.png"),
      CategoryModel(name: "Burger", image: "assets/images/burger.png"),
      CategoryModel(name: "Chinese", image: "assets/images/chinese.png"),
      CategoryModel(name: "Mexican", image: "assets/images/tacos.png"),
    ];

    return category;
  }
}
