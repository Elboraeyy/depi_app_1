import 'package:depi_app_1/models/product.dart';

const products = <Product>[
  Product(
    id: 'apple',
    name: 'Red Apple',
    category: 'Fruits',
    image: 'assets/images/585d3c30cb11b227491c335d 1.png',
    price: 4.99,
    unit: '1 kg',
    description: 'Fresh red apples selected from the best farms.',
  ),
  Product(
    id: 'banana',
    name: 'Original Banana',
    category: 'Fruits',
    image: 'assets/images/PikPng 1.png',
    price: 5.99,
    unit: '1 kg',
    description: 'Sweet and fresh bananas for your family.',
  ),
  Product(
    id: 'mango',
    name: 'Original Mango',
    category: 'Fruits',
    image: 'assets/images/purepng 1.png',
    price: 3.00,
    unit: '1 kg',
    description: 'Golden ripe mangoes delivered to your home.',
  ),
  Product(
    id: 'avocado',
    name: 'Avocado Bowl',
    category: 'Vegetables',
    image: 'assets/images/Avocado-PNG-Clipart 1.png',
    price: 24.00,
    unit: '1 bowl',
    description: 'Creamy and delicious avocados, ready to eat.',
  ),
  Product(
    id: 'salmon',
    name: 'Fresh Salmon',
    category: 'Fish',
    image: 'assets/images/purepng 1 (2).png',
    price: 50.00,
    unit: '1 kg',
    description: 'Fresh salmon with a delicious taste.',
  ),
  Product(
    id: 'vegetables',
    name: 'Fresh Vegetables',
    category: 'Vegetables',
    image: 'assets/images/Group (1).png',
    price: 12.00,
    unit: '1 basket',
    description: 'A useful basket of fresh vegetables.',
  ),
];

const categoryImages = <String>[
  'assets/images/noun_Fruit_2287486 1.png',
  'assets/images/Group.png',
  'assets/images/Group (2).png',
  'assets/images/Group (4).png',
];

const categoryNames = <String>['Fruits', 'Vegetables', 'Meat', 'Fish'];
