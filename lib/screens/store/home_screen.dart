import 'package:flutter/material.dart';
import 'package:depi_app_1/data/store_data.dart';
import 'package:depi_app_1/screens/store/product_details_screen.dart';
import 'package:depi_app_1/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onCategoriesPressed, this.onCartPressed});

  final VoidCallback? onCategoriesPressed;
  final VoidCallback? onCartPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello!',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const Text(
                        'Find your groceries',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: onCartPressed,
                    icon: const Icon(Icons.shopping_cart_outlined),
                    color: const Color(0xffff5e00),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                readOnly: true,
                onTap: onCategoriesPressed,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/complimentary-dish 1.png',
                  height: 145,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton(
                    onPressed: onCategoriesPressed,
                    child: const Text('See All'),
                  ),
                ],
              ),
              SizedBox(
                height: 115,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: onCategoriesPressed,
                      child: Container(
                        width: 88,
                        margin: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 34,
                              backgroundColor: Colors.primaries[index].shade100,
                              child: Image.asset(categoryImages[index]),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              categoryNames[index],
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Deals',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton(
                    onPressed: onCategoriesPressed,
                    child: const Text('See All'),
                  ),
                ],
              ),
              SizedBox(
                height: 275,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ProductItem(
                        product: product,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: product),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
