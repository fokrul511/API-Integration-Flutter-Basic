import 'package:crud_task_apps/add_task_list_screen.dart';
import 'package:crud_task_apps/edit_task_list_screen.dart';
import 'package:flutter/material.dart';

enum myPopUpButtonItem {
  edit,
  delete,
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('Product Name'),
            subtitle: const Wrap(
              spacing: 16.0,
              children: [
                Text('Proudcut Code'),
                Text('Proudcut Code'),
                Text('Unit Price'),
                Text('Quantity'),
                Text('Total Price'),
              ],
            ),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/73265474?v=4'),
            ),
            trailing: PopupMenuButton<myPopUpButtonItem>(
              onSelected: onTapPoupMenuButton,
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () {
                    print('edit');
                  },
                  value: myPopUpButtonItem.edit,
                  child: const Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Edit'),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: myPopUpButtonItem.delete,
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskListScreen(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),
    );
  }

  void onTapPoupMenuButton(myPopUpButtonItem type) {
    switch (type) {
      case myPopUpButtonItem.edit:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditTaskListScreen(),
            ));
        break;
      case myPopUpButtonItem.delete:
        showDilago();
    }
  }

  void showDilago() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Product'),
          content: Text('Are you sure that you want to delete this Product'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancal')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Yes,delete'),
            ),
          ],
        );
      },
    );
  }
}
