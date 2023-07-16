import 'package:flutter/material.dart';
import 'package:mobile_application/product_details.dart';
import 'package:mobile_application/users_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List (2)'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Product List Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const UserScreen(),
                    ),
                    (route) => true);

                /// in case of true pushAndRemoveUntil == push
              },
              child: const Text('User List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const ProductDetails(productName: 'ASUS Laptop'),
                  ),
                ).then(
                  (value) {
                    print(value);
                  },
                );
              },
              child: const Text('Product Details'),
            ),
          ],
        ),
      ),
    );
  }
}
