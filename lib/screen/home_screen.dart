import 'package:crud_task_apps/RestApi/clientApi.dart';
import 'package:crud_task_apps/style/style.dart';
import 'package:flutter/material.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  List productList = [];

  loadData() async {
    var data = await getProduct();
    var productList = data;
    print(productList);
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Home Screen'),
      ),
      body: GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image(
                    image: NetworkImage(productList[index]['Img']),
                    fit: BoxFit.cover,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productList[index]['ProductName'],
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text('Price: ', style: TextStyle(fontSize: 18)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete_outline)),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          );
        },
      ),
      floatingActionButton: floatingActionButton(context),
    );
  }
}
