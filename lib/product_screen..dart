import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int counter = 0;

  Map<String, Map<String, int>> product = {
    '\$10.00': {'Product 1': 0},
    '\$15.00': {'Product 1': 0},
    '\$20.00': {'Product 1': 0},
    '\$25.00': {'Product 1': 0},
    '\$30.00': {'Product 1': 0},
    '\$35.00': {'Product 1': 0},
    '\$40.00': {'Product 1': 0},
    '\$45.00': {'Product 1': 0},
    '\$50.00': {'Product 1': 0},
    '\$55.00': {'Product 1': 0},
    '\$60.00': {'Product 1': 0},
    '\$65.00': {'Product 1': 0},
    '\$70.00': {'Product 1': 0},
    '\$75.00': {'Product 1': 0},
    '\$80.00': {'Product 1': 0},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: product.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(product.values.elementAt(index).toString()),
                  subtitle: Text(product.keys.elementAt(index).toString()),
                  trailing: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('counter $counter'),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 10),
                          onPressed: () {
                            product[counter++];
                            setState(() {});
                          },
                          child: const Text('Buy now'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}


