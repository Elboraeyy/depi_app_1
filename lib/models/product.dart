class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.unit,
    required this.description,
  });

  final String id;
  final String name;
  final String category;
  final String image;
  final double price;
  final String unit;
  final String description;
}
