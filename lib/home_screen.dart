import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_application/add_new_product_screen.dart';
import 'package:http/http.dart';
import 'package:mobile_application/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    Response response = await get(
      Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'),
    );
    print(response.statusCode);
    print(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    //print(decodedResponse['data'].length);

    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      decodedResponse['data'].forEach(
        (e) {
          products.add(
            Product(e['_id'], e['ProductName'], e['ProductCode'], e['Img'],
                e['UnitPrice'], e['TotalPrice'], e['CreatedDate'], e['Qty']),
          );
        },
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CURD App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewProductScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.only(left: 16, top: 8),
                    contentPadding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Choose an action'),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit'),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(Icons.delete),
                          title: const Text('Delete'),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            title: Text('Product Name: ${products[index].productName}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Code: ${products[index].productCode}'),
                Text('Total Price: ${products[index].totalPrice}'),
                Text('Quantity: ${products[index].quantity}'),
              ],
            ),
            leading: Image.network(
              products[index].image,
              width: 50,
              height: 50,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.image,
                  size: 32,
                );
              },
            ),
            trailing: Text('Unit Price: \n${products[index].unitPrice}'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
