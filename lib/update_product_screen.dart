import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_application/product.dart';

class UpdateProductScreen extends StatefulWidget {
  final Product product;
  const UpdateProductScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool inProgress = false;

  @override
  void initState() {
    _nameTEController.text = widget.product.productName;
    _productCodeTEController.text = widget.product.productCode;
    _priceTEController.text = widget.product.unitPrice;
    _quantityTEController.text = widget.product.quantity;
    _totalPriceTEController.text = widget.product.totalPrice;
    _imageTEController.text = widget.product.image;
    super.initState();
  }

  void updateProduct() async {
    inProgress = true;
    if (mounted) {
      setState(() {});
    }
    Response response = await post(
      Uri.parse(
          'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}'),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(
        {
          "Img": _imageTEController.text.trim(),
          "ProductCode": _productCodeTEController.text.trim(),
          "ProductName": _nameTEController.text.trim(),
          "Qty": _quantityTEController.text.trim(),
          "TotalPrice": _totalPriceTEController.text.trim(),
          "UnitPrice": _priceTEController.text.trim()
        },
      ),
    );
    inProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.statusCode == 200) {
      final decodedBody = jsonDecode(response.body);
      if (decodedBody['status'] == 'success') {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product successfully updated'),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Update of product failed, try again'),
            ),
          );
        }
      }
    }

    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formState,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameTEController,
                  decoration: const InputDecoration(
                    hintText: 'Product Name',
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'enfefhdsf';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _productCodeTEController,
                  decoration: const InputDecoration(
                    hintText: 'Product Code',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _priceTEController,
                  decoration: const InputDecoration(
                    hintText: 'Product Price',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _quantityTEController,
                  decoration: const InputDecoration(
                    hintText: 'Quantity',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _totalPriceTEController,
                  decoration: const InputDecoration(
                    hintText: 'Total Price',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _imageTEController,
                  decoration: const InputDecoration(
                    hintText: 'Image',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: inProgress
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              updateProduct();
                            }
                          },
                          child: const Text('Update'),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

