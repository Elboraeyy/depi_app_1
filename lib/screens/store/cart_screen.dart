import 'package:flutter/material.dart';
import 'package:depi_app_1/controllers/cart_store.dart';
import 'package:depi_app_1/models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void checkout(BuildContext context) {
    if (CartStore.instance.count == 0) return;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order placed'),
        content: const Text('Your order was placed successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              CartStore.instance.clear();
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CartStore.instance,
      builder: (context, child) {
        final cart = CartStore.instance;
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            foregroundColor: const Color(0xffff5e00),
            elevation: 0,
            centerTitle: true,
            title: const Text('Cart'),
          ),
          body: cart.items.isEmpty
              ? const Center(child: Text('Your cart is empty'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final product = cart.items[index];
                          return _CartItem(product: product);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '\$${cart.total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Color(0xffff5e00),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          ElevatedButton(
                            onPressed: () => checkout(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff5e00),
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(50),
                            ),
                            child: const Text('CheckOut'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = CartStore.instance;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(width: 75, height: 75, child: Image.asset(product.image)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  product.unit,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Color(0xffff5e00)),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => cart.remove(product),
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text('${cart.quantity(product)}'),
              IconButton(
                onPressed: () => cart.add(product),
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
