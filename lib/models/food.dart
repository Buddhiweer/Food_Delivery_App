// food item
class Food {
  final String name; // food name
  final String discription; // food description
  final String imagePath; // food image path
  final double price; // food price
  final FoodCategory category; // food category
  List<Addon> availableAddons; //[extra sauce, extra cheese]

  Food({
    required this.discription,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// food category
enum FoodCategory {
  burger,
  salads,
  pizzas,
  sides,
  desserts,
  drinks,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
