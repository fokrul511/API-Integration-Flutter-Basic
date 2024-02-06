import 'package:crud_task_apps/screen/product_create_screen.dart';
import 'package:flutter/material.dart';

floatingActionButton(context) {
  return FloatingActionButton.extended(
    backgroundColor: Colors.purple,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateProductScreen(),
          ));
    },
    label: const Text('Add'),
    icon: const Icon(Icons.note_alt_outlined),
  );
}

textFormFild(context, text, controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: text,
      border: const OutlineInputBorder(),
    ),
  );
}

buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.purple,
    foregroundColor: Colors.white,
  );
}
