import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTaskListScreen extends StatefulWidget {
  const AddTaskListScreen({super.key});

  @override
  State<AddTaskListScreen> createState() => _AddTaskListScreenState();
}

class _AddTaskListScreenState extends State<AddTaskListScreen> {
  //--------------------------------------------------------
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _productQuantityController =
      TextEditingController();
  final TextEditingController _totalPriceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  //--------------------------------------------------------
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isButtonProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
                  decoration: const InputDecoration(hintText: 'Total Price'),
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
                  child: Visibility(
                    visible: isButtonProgress == false,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          createNewPost();
                          clearTextFild();
                          // Navigator.pop(context);
                        }
                      },
                      child: Text('Add'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createNewPost() async {
    isButtonProgress = true;
    setState(() {});
    Uri uri = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
    Map<String, dynamic> prams = {
      "Img": _imageController.text.trim() ?? '',
      "ProductCode": _productCodeController.text.trim(),
      "ProductName": _productNameController.text.trim(),
      "Qty": _productQuantityController.text.trim(),
      "TotalPrice": _totalPriceController.text.trim(),
      "UnitPrice": _unitPriceController.text.trim(),
    };
    http.Response response = await http.post(uri,
        body: jsonEncode(prams), headers: {'Content-type': 'Application/json'});
    if (response.statusCode == 200) {
      clearTextFild();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfuly Created')));
    }
    isButtonProgress = false;
    setState(() {});
  }

  //
  void clearTextFild() {
    _unitPriceController.clear();
    _totalPriceController.clear();
    _productQuantityController.clear();
    _productNameController.clear();
    _productCodeController.clear();
    _imageController.clear();
  }
  @override
  void dispose() {
   _imageController.clear();
   _productCodeController.clear();
   _productNameController.clear();
   _productQuantityController.clear();
   _unitPriceController.clear();
   _totalPriceController.clear();
    super.dispose();
  }
}
