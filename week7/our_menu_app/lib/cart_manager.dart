import 'dart:async';

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<CartItem> _items = [];
  final _cartController = StreamController<List<CartItem>>.broadcast();

  Stream<List<CartItem>> get cartStream => _cartController.stream;
  List<CartItem> get items => _items;

  void addToCart(CartItem item) {
    final existingItemIndex = _items.indexWhere((i) => i.name == item.name);
    if (existingItemIndex != -1) {
      _items[existingItemIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    _cartController.add(_items);
  }

  void updateQuantity(int index, int quantity) {
    if (quantity > 0) {
      _items[index].quantity = quantity;
    } else {
      _items.removeAt(index);
    }
    _cartController.add(_items);
  }

  int get total => _items.fold(0, (sum, item) => sum + (item.price * item.quantity));
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