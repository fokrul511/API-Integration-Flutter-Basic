import 'dart:convert';

import 'package:crud_task_apps/add_task_list_screen.dart';
import 'package:crud_task_apps/edit_task_list_screen.dart';
import 'package:crud_task_apps/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List<Product> productList = [];
  bool isCircularProgress = false;

  @override
  void initState() {
    getProductFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getProductFromApi();
        },
        child: Visibility(
          visible: isCircularProgress == false,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(productList[index].productName.toString()),
                subtitle: Wrap(
                  spacing: 16.0,
                  children: [
                    Text(productList[index].productCode ?? 'knwon'),
                    Text(productList[index].unitPrice ?? 'knwon'),
                    Text(productList[index].productQuantity.toString() ??
                        'knwon'),
                    Text(productList[index].totalPric.toString() ?? 'knwon'),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      productList[index].image.toString() ?? 'knwon'),
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
        ),
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

  Future<void> getProductFromApi() async {
    isCircularProgress = true;
    setState(() {});
    //step 1
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    //step 2
    http.Response response = await http.get(uri);
    //step 3
    if (response.statusCode == 200) {
      productList.clear();
      var decodeRespon = jsonDecode(response.body);
      print(response);
      print(response.statusCode);
      print(response.body);
      if (decodeRespon['status'] == 'success') {
        var list = decodeRespon['data'];
        for (var item in list) {
          Product product = Product.jason(item);
          productList.add(product);
        }
        setState(() {});
      }
      isCircularProgress = false;
      setState(() {});
    }
  }
}
