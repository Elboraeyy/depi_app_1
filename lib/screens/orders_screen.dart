import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          foregroundColor: const Color(0xffff5e00),
          elevation: 0,
          centerTitle: true,
          title: const Text('Orders'),
          bottom: const TabBar(
            labelColor: Color(0xffff5e00),
            indicatorColor: Color(0xffff5e00),
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _EmptyOrders(text: 'No ongoing orders'),
            _OrderHistory(),
          ],
        ),
      ),
    );
  }
}

class _EmptyOrders extends StatelessWidget {
  const _EmptyOrders({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}

class _OrderHistory extends StatelessWidget {
  const _OrderHistory();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _OrderTile(number: '#345', status: 'Delivered', price: '\$70'),
        _OrderTile(number: '#346', status: 'Canceled', price: '\$452'),
        _OrderTile(number: '#347', status: 'Delivered', price: '\$281'),
      ],
    );
  }
}

class _OrderTile extends StatelessWidget {
  const _OrderTile({
    required this.number,
    required this.status,
    required this.price,
  });

  final String number;
  final String status;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xffffe0cc),
            child: Icon(Icons.shopping_bag, color: Color(0xffff5e00)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order $number',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(status, style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          ),
          Text(price, style: const TextStyle(color: Color(0xffff5e00))),
        ],
      ),
    );
  }
}
