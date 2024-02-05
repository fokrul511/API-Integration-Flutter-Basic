import 'package:crud_task_apps/style/style.dart';
import 'package:flutter/material.dart';

class ProductHomeScreen extends StatelessWidget {
  const ProductHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Home Screen'),
      ),
      body: GridView.builder(
        itemCount: 10,
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
                    image: NetworkImage(
                        'https://avatars.githubusercontent.com/u/73265474?v=4'),
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
                        'Product Name',
                        style: TextStyle(fontSize: 20),
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
