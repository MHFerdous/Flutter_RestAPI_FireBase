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
    print(response.statusCode);
    print(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    //print(decodedResponse['data'].length);

    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      for (var e in decodedResponse['data']) {
        products.add(
          Product.toJson(e),
        );
      }
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
