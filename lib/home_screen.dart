import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_application/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [];

  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'),
    );
    /*print(response.statusCode);
    print(response.body);*/
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    //print(decodedResponse['data'].length);

    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      products.clear();
      for (var e in decodedResponse['data']) {
        products.add(
          Product.toJson(e),
        );
      }
    }
    inProgress = false;
    setState(() {});
  }

  void deleteProduct(String id) async {
    inProgress = true;
    setState(() {});

    Response response = await get(
      Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/$id'),
    );
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      getProducts();
    } else {
      inProgress = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CURD App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              getProducts();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
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
