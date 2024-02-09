import 'package:crud_task_apps/screen/create_screen.dart';
import 'package:crud_task_apps/screen/edit_screen.dart';
import 'package:flutter/material.dart';

enum PopUpManuType { edit, delete }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud Apps'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product Name'),
            subtitle: const Wrap(
              spacing: 16.0,
              children: [
                Text('product Code'),
                Text('product UnitPrice'),
                Text('product Quantity'),
                Text('product Total Price'),
                Text('product Image'),
              ],
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.excelestore.com.bd/public/uploads/all/doHFTlsXaV1wG3TIthW0Z2Gxxddtyxyyvz36FmL0.webp'),
            ),
            trailing: PopupMenuButton<PopUpManuType>(
              onSelected: onTapPopUpMenuButton,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text('Edit'),
                  value: PopUpManuType.edit,
                ),
                const PopupMenuItem(
                  child: Text('Delete'),
                  value: PopUpManuType.delete,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateScreen(),
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  void onTapPopUpMenuButton(PopUpManuType type) {
    switch (type) {
      case PopUpManuType.edit:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditScreen(),
          ),
        );
        break;
      case PopUpManuType.delete:
        _showDelete();
        break;
    }
  }

  void _showDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure that you want to delete this Product?'),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('Yes, delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            )
          ],
        );
      },
    );
  }
}
