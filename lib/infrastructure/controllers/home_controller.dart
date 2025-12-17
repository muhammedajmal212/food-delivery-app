import 'package:food_delivery_app/infrastructure/service/catetegory_service.dart';
import 'package:food_delivery_app/infrastructure/service/item_service.dart';
import 'package:food_delivery_app/model/category_model.dart';
import 'package:food_delivery_app/model/item_model.dart';

class HomeController {
  final CatetegoryService catetegoryService;
  final ItemService itemService;
  HomeController({required this.catetegoryService, required this.itemService});

  List<CategoryModel> getCategory() => catetegoryService.getCategories();
  List<ItemModel> getPizza() => itemService.getPizza();
  List<ItemModel> getBurger() => itemService.getburger();
  List<ItemModel> chinese() => itemService.getChinease();
  List<ItemModel> getMexican() => itemService.getMexicanFoodItems();
}
