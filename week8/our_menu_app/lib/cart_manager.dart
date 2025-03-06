import 'package:flutter/foundation.dart';

class CartManager extends ChangeNotifier {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<CartItem> _items = [];
  
  List<CartItem> get items => List.unmodifiable(_items);
  
  int get total => _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  
  void addToCart(CartItem item) {
    final existingItemIndex = _items.indexWhere((i) => i.name == item.name);
    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void updateQuantity(int index, int quantity) {
    if (quantity > 0) {
      _items[index].quantity = quantity;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

class CartItem {
  final String name;
  final int price;
  final String image;
  final String? description;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.description,
    required this.quantity,
  });
}