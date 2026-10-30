import 'package:flutter/material.dart';
import 'package:depi_app_1/controllers/cart_store.dart';
import 'package:depi_app_1/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product, this.onTap});

  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 275,
        width: 190,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.asset(product.image)),
            const SizedBox(height: 10),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.brown,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              product.unit,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () => CartStore.instance.add(product),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
