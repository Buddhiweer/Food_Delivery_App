import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      discription: "A juicy beef patty with cheese, lettuce, and tomato",
      imagePath: "lib/images/burgers/burger_1.png",
      name: "Classic Cheeseburger",
      price: 0.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.95),
        Addon(name: "Extra Sauce", price: 0.85),
        Addon(name: "Extra Veggie", price: 0.99),
      ],
    ),
    Food(
      discription:
          "Renowned for its depth of flavor, the Umami Burger features a savory beef patty infused with umami-rich ingredients like mushrooms, soy sauce, and Parmesan cheese. ",
      imagePath: "lib/images/burgers/burger_2.png",
      name: "Umami Burger",
      price: 1.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.95),
        Addon(name: "Extra Sauce", price: 0.85),
        Addon(name: "Extra Veggie", price: 0.99),
      ],
    ),
    Food(
      discription:
          "A regional specialty from Oklahoma, the Onion Burger showcases a beef patty cooked with thinly sliced onions pressed into the meat, creating a caramelized and flavorful crust. ",
      imagePath: "lib/images/burgers/burger_3.png",
      name: "Union Burger",
      price: 1.99,
      category: FoodCategory.burger,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.95),
        Addon(name: "Extra Sauce", price: 0.85),
        Addon(name: "Extra Veggie", price: 0.99),
      ],
    ),

    // salads
    Food(
      discription:
          "Greek salad Caesar salad Chicken salad Greek cuisine Spinach salad, Greek Salad, leaf Vegetable, food, recipe",
      imagePath: "lib/images/salads/salad_1.png",
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
      discription:
          "Corn flakes Tableware Potato chip Side dish Flavor, others, food, corn Flakes, cuisine",
      imagePath: "lib/images/sides/side_1.png",
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
      imagePath: "lib/images/desserts/dessert_1.png",
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
      imagePath: "lib/images/drinks/drink_1.png",
      name: "Mojito",
      price: 4.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Mint", price: 0.95),
        Addon(name: "Extra Puree", price: 0.85),
        Addon(name: "Splash of coconut rum", price: 0.99),
      ],
    ),
    Food(
      discription: "Sundae Smoothie Milkshake Falooda Non-alcoholic drink",
      imagePath: "lib/images/drinks/drink_2.png",
      name: "Faluda",
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
  List<CartItem> get cart => _cart;

  /* 

  Operations

  */

  // user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromcart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart
  double getTotalprice() {
    double total = 0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /* 

  Helpers

  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formatDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

    receipt.writeln("Date: $formatDate");
    receipt.writeln();
    receipt.writeln("_________");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} (${_formatAddons(cartItem.selectedAddons)})",
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalprice())}");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
