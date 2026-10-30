import 'package:flutter/material.dart';
import 'package:depi_app_1/controllers/cart_store.dart';
import 'package:depi_app_1/screens/orders_screen.dart';
import 'package:depi_app_1/screens/profile_screen.dart';
import 'package:depi_app_1/screens/store/cart_screen.dart';
import 'package:depi_app_1/screens/store/category_screen.dart';
import 'package:depi_app_1/screens/store/home_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selectedIndex = 0;

  void selectPage(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        onCategoriesPressed: () => selectPage(1),
        onCartPressed: () => selectPage(2),
      ),
      CategoryScreen(onCartPressed: () => selectPage(2)),
      const CartScreen(),
      const OrdersScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: AnimatedBuilder(
        animation: CartStore.instance,
        builder: (context, child) {
          return BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: selectPage,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xffff5e00),
            unselectedItemColor: Colors.brown.shade300,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.storefront_outlined),
                activeIcon: Icon(Icons.storefront),
                label: 'Shop',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                activeIcon: Icon(Icons.explore),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  isLabelVisible: CartStore.instance.count > 0,
                  label: Text('${CartStore.instance.count}'),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                activeIcon: Badge(
                  isLabelVisible: CartStore.instance.count > 0,
                  label: Text('${CartStore.instance.count}'),
                  child: const Icon(Icons.shopping_cart),
                ),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                activeIcon: Icon(Icons.receipt_long),
                label: 'Orders',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Account',
              ),
            ],
          );
        },
      ),
    );
  }
}
