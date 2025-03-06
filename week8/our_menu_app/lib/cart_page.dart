import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartManager>(
      builder: (context, cartManager, child) {
        if (cartManager.items.isEmpty) {
          return const Center(
            child: Text('ไม่มีสินค้าในตะกร้า'),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartManager.items.length,
                itemBuilder: (context, index) {
                  final item = cartManager.items[index];
                  return CartItemBox(
                    item: item,
                    index: index,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'ยอดรวมทั้งหมด:',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${cartManager.total} บาท',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement order confirmation logic
                      },
                      child: const Text('สั่งซื้อสินค้า'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CartItemBox extends StatelessWidget {
  final CartItem item;
  final int index;

  const CartItemBox({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(
                "assets/images/${item.image}",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${item.price} บาท',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Consumer<CartManager>(
              builder: (context, cartManager, child) {
                return Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cartManager.updateQuantity(index, item.quantity - 1);
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      item.quantity.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      onPressed: () {
                        cartManager.updateQuantity(index, item.quantity + 1);
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}