import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Map<String, String> product = {
    '\$10.00': 'Product 1',
    '\$15.00': 'Product 2',
    '\$20.00': 'Product 3',
    '\$25.00': 'Product 4',
    '\$30.00': 'Product 5',
    '\$35.00': 'Product 6',
    '\$40.00': 'Product 7',
    '\$45.00': 'Product 8',
    '\$50.00': 'Product 9',
    '\$55.00': 'Product 10',
    '\$60.00': 'Product 10',
    '\$65.00': 'Product 11',
    '\$70.00': 'Product 12',
    '\$75.00': 'Product 13',
    '\$80.00': 'Product 14',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Scrollbar(
              child: ListView.separated(
                  itemCount: product.length,
                  /*primary: false,
                shrinkWrap: true,*/
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(product.values.elementAt(index).toString()),
                        subtitle:
                            Text(product.keys.elementAt(index).toString()),
                        trailing: ElevatedButton(
                          onPressed: () {
                            return;
                          },
                          child: const Text('Buy Now'),
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 0,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
