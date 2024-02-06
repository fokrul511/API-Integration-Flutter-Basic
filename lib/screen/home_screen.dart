import 'dart:convert';

import 'package:crud_task_apps/screen/show_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../data/gellery.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  List<Gallery> albumList = [];
  bool load = false;

  @override
  void initState() {
    getProductd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: Visibility(
        visible: load == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowImageDitails(
                          title: albumList[index].title,
                          id: albumList[index].id,
                          bigImage: albumList[index].bigImage),
                    ),
                  );
                },
                leading: Image(
                  image: NetworkImage(albumList[index].image),
                ),
                title: Text(albumList[index].title),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 2,
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> getProductd() async {
    load = true;
    setState(() {});
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    // var postHeader = {'Content-Type': 'application/json'};
    Response response = await get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var responsBody = jsonDecode(response.body);
      var data = responsBody;
      for (var item in data) {
        Gallery gallery = Gallery(
            id: item['id'],
            title: item['title'],
            image: item['thumbnailUrl'],
            bigImage: item['url']);
        albumList.add(gallery);
      }
      setState(() {});
    }
    load = false;
    setState(() {});
  }
}
