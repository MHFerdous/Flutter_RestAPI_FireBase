import 'package:flutter/material.dart';
import 'cart_screen.dart';

class Product {
  final String name;
  final double price;
  int count;

  Product({required this.name, required this.price, this.count = 0});
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10.0),
    Product(name: 'Product 2', price: 15.0),
    Product(name: 'Product 3', price: 20.0),
    Product(name: 'Product 4', price: 25.0),
    Product(name: 'Product 5', price: 30.0),
    Product(name: 'Product 6', price: 35.0),
    Product(name: 'Product 7', price: 40.0),
    Product(name: 'Product 8', price: 45.0),
    Product(name: 'Product 9', price: 50.0),
    Product(name: 'Product 10', price: 55.0),
    Product(name: 'Product 11', price: 60.0),
    Product(name: 'Product 12', price: 65.0),
    Product(name: 'Product 13', price: 70.0),
    Product(name: 'Product 14', price: 75.0),
    Product(name: 'Product 15', price: 80.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('Price: \$${products[index].price.toString()}'),
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Counter: ${products[index].count}'),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      products[index].count++;
                      if (products[index].count == 5) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Congratulations!'),
                            content: Text(
                                'You\'ve bought 5 ${products[index].name}!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                      setState(
                        () {},
                      );
                    },
                    child: const Text('Buy Now'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(products: products)),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
