import 'package:crud_task_apps/screen/add_new_task.dart';
import 'package:flutter/material.dart';

enum PopUpmenuButton {
  edit,
  delete,
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('My Title'),
            subtitle: Text('Subtitle'),
            trailing: PopupMenuButton<PopUpmenuButton>(
              onSelected: (selectedMenu) {},
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      child: Text('Delete'), value: PopUpmenuButton.delete),
                  PopupMenuItem(
                      child: Text('Edit'), value: PopUpmenuButton.edit),
                ];
              },
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/73265474?v=4',
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewTask(),
              ),
            );
          },
          child: Text('Add')),
    );
  }
}
