import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  const ProductDetails({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Name (4)'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(productName),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Hello');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
