import 'package:food_delivery_app/models/food.dart';

class Restaurant {
  // list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      discription: "A juicy beef patty with cheese, lettuce, and tomato",
      imagePath: "lib/images/burgers/burger1.png",
      name: "Classic Cheeseburger",
      price: 0.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.95),
        Addon(name: "Extra Sauce", price: 0.85),
        Addon(name: "Extra Veggie", price: 0.99),
      ],
    ),

    // salads
    Food(
      discription: "Crispy lettuce, tomato, and cheese",
      imagePath: "lib/images/salads/salad1.png",
      name: "Ceaser Salad",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken ", price: 2.55),
        Addon(name: "Anchovies", price: 1.99),
        Addon(name: "Extra Parmesan", price: 0.99),
      ],
    ),

    // sides
    Food(
      discription: "A juicy beef patty with cheese, lettuce, and tomato",
      imagePath: "lib/images/sides/side1.png",
      name: "Classic Cheeseburger",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.95),
        Addon(name: "Extra Sauce", price: 0.85),
        Addon(name: "Extra Veggie", price: 0.99),
      ],
    ),

    // desserts
    Food(
      discription: "Rich and creamy chocolate cake",
      imagePath: "lib/images/desserts/dessert1.png",
      name: "Chocolate Cake",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 0.95),
        Addon(name: "Hot Fudge", price: 2.85),
        Addon(name: "Whipped Cream", price: 1.99),
      ],
    ),

    // drinks
    Food(
      discription: "A Classic Cuban Mojito with lime juice, mint, and soda",
      imagePath: "lib/images/drinks/drink1.png",
      name: "Mojito",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Mint", price: 0.95),
        Addon(name: "Extra Puree", price: 0.85),
        Addon(name: "Splash of coconut rum", price: 0.99),
      ],
    ),
  ];

  /* 

  Getters 
  
  */

  List<Food> get menu => _menu;

  /* 

  Operations

  */

  // add to cart

  // remove from cart

  // get total price of cart

  // get total items in cart

  // clear cart

  /* 

  Helpers

  */

  // generate a receipt

  // format double value into money

  // format list of addons into a string summary
}
