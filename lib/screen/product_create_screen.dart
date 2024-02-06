import 'package:flutter/material.dart';

import '../style/style.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  TextEditingController _productNameTEController = TextEditingController();
  TextEditingController _productPriceTEController = TextEditingController();
  TextEditingController _productImageTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            textFormFild(
              context,
              'Product Name',
              _productNameTEController,
            ),
            const SizedBox(height: 8.0),
            textFormFild(
              context,
              'Product Price',
              _productPriceTEController,
            ),
            const SizedBox(height: 8.0),
            textFormFild(
              context,
              'Product Image',
              _productImageTEController,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 40,
              child: ElevatedButton(
                style: buttonStyle(),
                onPressed: () {},
                child: const Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
