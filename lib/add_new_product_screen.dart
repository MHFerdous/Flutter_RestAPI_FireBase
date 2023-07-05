import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({Key? key}) : super(key: key);

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Product Name'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Product Code'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Product Price'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Quantity'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Total Price'),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Image'),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
