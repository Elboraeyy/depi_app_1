import 'package:flutter/material.dart';
import 'package:depi_app_1/controllers/cart_store.dart';
import 'package:depi_app_1/models/product.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xffff5e00),
        elevation: 0,
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () => setState(() => favorite = !favorite),
            icon: Icon(favorite ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Image.asset(product.image),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              product.name,
              style: const TextStyle(
                color: Color(0xff6d3805),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(product.unit, style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 10),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Color(0xffff5e00),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.description,
              style: TextStyle(color: Colors.brown.shade400, height: 1.4),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _QuantityButton(
                  icon: Icons.remove,
                  onPressed: quantity > 1
                      ? () => setState(() => quantity--)
                      : null,
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    '$quantity',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                _QuantityButton(
                  icon: Icons.add,
                  onPressed: () => setState(() => quantity++),
                ),
              ],
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {
                for (var index = 0; index < quantity; index++) {
                  CartStore.instance.add(product);
                }
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Added to cart')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffff5e00),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(52),
              ),
              child: const Text('Add To Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        side: BorderSide(color: Colors.orange.shade200),
      ),
      icon: Icon(icon, color: const Color(0xffff5e00)),
    );
  }
}
