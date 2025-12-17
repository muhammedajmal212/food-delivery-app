import 'package:food_delivery_app/model/item_model.dart';

class ItemService {
  List<ItemModel> getPizza() {
    List<ItemModel> pizza = [
      ItemModel(
        name: "CheesePizza",
        image: "assets/images/pizza1.png",
        price: "20",
      ),
      ItemModel(
        name: "Margherita Pizza",
        image: "assets/images/pizza2.png",
        price: "60",
      ),
      ItemModel(
        name: "Mexican Street Corn Pizza",
        image: "assets/images/Mexican Street Corn Pizza.webp",
        price: "280",
      ),
      ItemModel(
        name: "Paneer Pizza",
        image: "assets/images/Paneer Pizza.webp",
        price: "250",
      ),
      ItemModel(
        name: "Pepporoni Pizza",
        image: "assets/images/pepperoni_pizza.webp",
        price: "300",
      ),
      ItemModel(
        name: "Rosted Mashroom Pizza",
        image: "assets/images/Roasted Mashroom Pizza.webp",
        price: "330",
      ),
      ItemModel(
        name: "Vegiterian Bite Pizza",
        image: "assets/images/Vegetarian Bite Pizza.jpg",
        price: "280",
      ),
    ];

    return pizza;
  }

  List<ItemModel> getburger() {
    List<ItemModel> burger = [
      ItemModel(
        name: "Cheese Burger",
        image: "assets/images/burger1.png",
        price: "50",
      ),
      ItemModel(
        name: "Veggie Burger",
        image: "assets/images/burger2.png",
        price: "100",
      ),
      ItemModel(
        name: "Spicy Zinger Burger",
        image: "assets/images/Spicy Zinger Burger.jpg",
        price: "250",
      ),
      ItemModel(
        name: "Zinger Burger with-fries-chicken-burge",
        image:
            "assets/images/zinger-burger-with-fries-chicken-burger_926154-893.jpg",
        price: "370",
      ),
      ItemModel(
        name: "Chicken Zinger Burger",
        image: "assets/images/Chicken Zinger Burger - Tandoori.jpg",
        price: "240",
      ),
    ];
    return burger;
  }

  List<ItemModel> getChinease() {
    List<ItemModel> chinese = [
      ItemModel(
        name: "Beef Chow Fun",
        image: "assets/images/chinese/beef-chow-fun-9.jpg",
        price: "230",
      ),
      ItemModel(
        name: "Dan Dan Noodles",
        image: "assets/images/chinese/Dan Dan Noodles.jpg",
        price: "20",
      ),
      ItemModel(
        name: "Fried Dumblings",
        image: "assets/images/chinese/Frieed Dumblings.jpg",
        price: "10",
      ),
      ItemModel(
        name: "Schezwan Chicken Momos",
        image: "assets/images/chinese/schezwan-chicken-momos-.jpg",
        price: "15",
      ),
      ItemModel(
        name: "Veg Schezwan Momos",
        image: "assets/images/chinese/veg_schezwan_momos_01.png",
        price: "59",
      ),
      ItemModel(
        name: "Ved Dan Dan Noodles",
        image: "assets/images/chinese/Vegan-Dan-Dan-Noodles-5-768x960.jpg",
        price: "49",
      ),
    ];
    return chinese;
  }

  List<ItemModel> getMexicanFoodItems() {
    List<ItemModel> mexicanFoods = [
      ItemModel(
        name: "Sopa de Lima",
        image: "assets/images/mexican food items/Sopa de Lima.jpg",
        price: "80",
      ),
      ItemModel(
        name: "Pot Carnitas",
        image: "assets/images/mexican food items/Pot Carnitas.jpg",
        price: "30",
      ),
      ItemModel(
        name: "Mole Poblano",
        image: "assets/images/mexican food items/mole poblano.jpeg",
        price: "15",
      ),
      ItemModel(
        name: "Mexican Special Tacos",
        image: "assets/images/mexican food items/Mexican Special Tacos.png",
        price: "18",
      ),
      ItemModel(
        name: "Huevos Rancheros",
        image: "assets/images/mexican food items/huevos Rancheros.jpg",
        price: "15",
      ),
      ItemModel(
        name: "Dorilocos",
        image: "assets/images/mexican food items/Dorilocos.png",
        price: "23",
      ),
      ItemModel(
        name: "Authentic Mole Poblano",
        image: "assets/images/mexican food items/authentic mole poblano.jpg",
        price: "37",
      ),
    ];
    return mexicanFoods;
  }
}
