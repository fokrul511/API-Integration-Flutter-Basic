import 'dart:convert';

import 'package:crud_task_apps/product.dart';
import 'package:crud_task_apps/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EditTaskListScreen extends StatefulWidget {
  const EditTaskListScreen({super.key, required this.product});

  final Product product;

  @override
  State<EditTaskListScreen> createState() => _EditTaskListScreenState();
}

class _EditTaskListScreenState extends State<EditTaskListScreen> {
  //--------------------------------------------------------
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  bool _updateProductInProgress = false;

  //--------------------------------------------------------
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    _productNameController.text = widget.product.productName ?? "";
    _productCodeController.text = widget.product.productCode ?? "";
    _unitPriceController.text = widget.product.unitPrice ?? "";
    _productQuantityController.text = widget.product.productQuantity ?? "";
    _totalPriceController.text = widget.product.totalPric ?? "";
    _imageController.text = widget.product.image ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'product name';
                    }
                    return null;
                  },
                  controller: _productNameController,
                  decoration: InputDecoration(hintText: 'Product Name'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Product Code';
                    }
                    return null;
                  },
                  controller: _productCodeController,
                  decoration: InputDecoration(hintText: 'Product Code'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Unit Price';
                    }
                    return null;
                  },
                  controller: _unitPriceController,
                  decoration: InputDecoration(hintText: 'Unit Price'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Product Quantity';
                    }
                    return null;
                  },
                  controller: _productQuantityController,
                  decoration: InputDecoration(hintText: 'Product Quantity'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Total Price';
                    }
                    return null;
                  },
                  controller: _totalPriceController,
                  decoration: InputDecoration(hintText: 'Total Price'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Image';
                    }
                    return null;
                  },
                  controller: _imageController,
                  decoration: InputDecoration(hintText: 'Image'),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        updateProduct();
                      }
                    },
                    child: Visibility(
                        visible: _updateProductInProgress == false,
                        replacement:
                            const Center(child: CircularProgressIndicator()),
                        child: const Text('Update')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    _updateProductInProgress = true;
    setState(() {});
    Uri url = Uri.parse(
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}');
    Product product = Product(
      id: widget.product.id,
      image:  _imageController.text.trim(),
      productQuantity: _productQuantityController.text.trim(),
      unitPrice:_unitPriceController.text.trim(),
      totalPric: _totalPriceController.text.trim(),
      productCode: _productCodeController.text.trim(),
      productName: widget.product.productName,
    );


    final Response response = await post(url,
        body: jsonEncode(product.tojason()), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      if (decodeData['status'] == 'success') {
        Navigator.pop(context);
      } else {
        _updateProductInProgress = true;
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product Update Fail? Try again')));
      }
    } else {
      _updateProductInProgress = true;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Product Update Fail? Try again')));
    }
  }

  clear() {
    _productNameController.clear();
    _unitPriceController.clear();
    _totalPriceController.clear();
    _productQuantityController.clear();
    _imageController.clear();
    _productCodeController.clear();
  }
}
