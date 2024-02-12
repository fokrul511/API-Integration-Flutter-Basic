import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController productTEController = TextEditingController();
  final TextEditingController codeTEController = TextEditingController();
  final TextEditingController unitPirceTEController = TextEditingController();
  final TextEditingController quantityTEController = TextEditingController();
  final TextEditingController totalTEController = TextEditingController();
  final TextEditingController imageTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Data')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: productTEController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: codeTEController,
              decoration: const InputDecoration(
                labelText: 'Product Code',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: unitPirceTEController,
              decoration: const InputDecoration(
                labelText: 'Unit Price',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: quantityTEController,
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: totalTEController,
              decoration: const InputDecoration(
                labelText: 'Total Price',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: imageTEController,
              decoration: const InputDecoration(
                labelText: 'Image',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
