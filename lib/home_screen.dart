import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_application/add_new_product_screen.dart';
import 'package:http/http.dart';
import 'package:mobile_application/product.dart';
import 'package:mobile_application/update_product_screen.dart';

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
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          titlePadding: const EdgeInsets.only(left: 16, top: 8),
                          contentPadding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 8),
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
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateProductScreen(
                                                  product: products[index])));
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('Edit'),
                              ),
                              const Divider(
                                height: 0,
                              ),
                              ListTile(
                                onTap: () {
                                  deleteProduct(products[index].id);
                                  Navigator.pop(context);
                                },
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
