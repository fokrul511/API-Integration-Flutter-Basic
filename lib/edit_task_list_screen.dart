import 'package:crud_task_apps/task_list_screen.dart';
import 'package:flutter/material.dart';

class EditTaskListScreen extends StatefulWidget {
  const EditTaskListScreen({super.key});

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

  //--------------------------------------------------------
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

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
                  controller: _totalPriceController,
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
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Update'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
