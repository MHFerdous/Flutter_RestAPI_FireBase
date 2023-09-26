import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List App',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: "iPhone 13", price: 799.99),
    Product(name: "Samsung Ultra", price: 999.99),
    Product(name: "Google Pixel 6", price: 799.99),
    Product(name: "OnePlus 9 Pro", price: 899.99),
    Product(name: "Xiaomi Mi 11", price: 699.99),
    Product(name: "Sony Xperia 1 III", price: 1099.99),
    Product(name: "LG Velvet", price: 599.99),
    Product(name: "Huawei P40 Pro", price: 899.99),
    Product(name: "Motorola Edge", price: 699.99),
    Product(name: "Oppo Find X3 Pro", price: 799.99),
    Product(name: "ASUS ROG Phone 5", price: 1099.99),
    Product(name: "Nokia 8.3", price: 599.99),
  ];

  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Product List")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItemCount: cartItemCount),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: ListTile(
              title: Text(
                products[index].name,
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "\$${products[index].price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 10),
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Count: ${products[index].counter}',
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    height: 35,
                    width: 60,
                    child: TextButton(
                      onPressed: () {
                        setState(
                          () {
                            products[index].incrementCounter();
                            if (products[index].counter == 5) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Congratulations!"),
                                    content: Text(
                                      "You've bought 5 ${products[index].name}!",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            cartItemCount++;
                          },
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter = 0;

  Product({required this.name, required this.price});

  void incrementCounter() {
    counter++;
  }
}

class CartPage extends StatelessWidget {
  final int cartItemCount;

  CartPage({required this.cartItemCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Text("Total Items in Cart: $cartItemCount"),
      ),
    );
  }
}
