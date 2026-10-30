import 'package:flutter/material.dart';
import 'package:depi_app_1/core/helpers/custom_app_field.dart';
import 'package:depi_app_1/data/store_data.dart';
import 'package:depi_app_1/screens/store/product_details_screen.dart';
import 'package:depi_app_1/widgets/product_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, this.onCartPressed});

  final VoidCallback? onCartPressed;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String searchText = '';

  List<String> get visibleCategories => categoryNames
      .where(
        (category) => category.toLowerCase().contains(searchText.toLowerCase()),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        foregroundColor: const Color(0xffff5e00),
        elevation: 0,
        centerTitle: true,
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: widget.onCartPressed,
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: _CategorySearchField(
              onChanged: (value) => setState(() => searchText = value),
            ),
          ),
        ),
      ),
      body: visibleCategories.isEmpty
          ? const Center(child: Text('No categories found'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: visibleCategories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.82,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final category = visibleCategories[index];
                final categoryIndex = categoryNames.indexOf(category);
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryProductsScreen(category: category),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor:
                              Colors.primaries[categoryIndex].shade100,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(categoryImages[categoryIndex]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          category,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final categoryProducts = products
        .where((product) => product.category == category)
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        foregroundColor: const Color(0xffff5e00),
        elevation: 0,
        title: Text(category),
      ),
      body: categoryProducts.isEmpty
          ? const Center(child: Text('No products in this category'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: categoryProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.72,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final product = categoryProducts[index];
                return ProductItem(
                  product: product,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product: product),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _CategorySearchField extends StatefulWidget {
  const _CategorySearchField({required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<_CategorySearchField> createState() => _CategorySearchFieldState();
}

class _CategorySearchFieldState extends State<_CategorySearchField> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppField(
      hint: 'Search',
      controller: controller,
      onChanged: widget.onChanged,
      suffixIcon: const Icon(Icons.search),
    );
  }
}
