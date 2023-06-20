import 'package:flutter/material.dart';
import 'package:mobile_application/product_screen..dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  const CartPage({super.key, required this.products});

  int getTotalQuantity() {
    int total = 0;
    for (var product in products) {
      total += product.count;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total Products: ${getTotalQuantity()}'),
      ),
    );
  }
}


