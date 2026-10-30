import 'package:flutter/foundation.dart';
import 'package:depi_app_1/data/store_data.dart';
import 'package:depi_app_1/models/product.dart';

class CartStore extends ChangeNotifier {
  CartStore._();

  static final CartStore instance = CartStore._();

  final Map<String, int> _quantities = {};

  List<Product> get items =>
      products.where((product) => _quantities.containsKey(product.id)).toList();

  int quantity(Product product) => _quantities[product.id] ?? 0;

  int get count => _quantities.values.fold(0, (total, value) => total + value);

  double get total => items.fold(
    0,
    (total, product) => total + product.price * quantity(product),
  );

  void add(Product product) {
    _quantities[product.id] = quantity(product) + 1;
    notifyListeners();
  }

  void remove(Product product) {
    final current = quantity(product);
    if (current <= 1) {
      _quantities.remove(product.id);
    } else {
      _quantities[product.id] = current - 1;
    }
    notifyListeners();
  }

  void clear() {
    _quantities.clear();
    notifyListeners();
  }
}
