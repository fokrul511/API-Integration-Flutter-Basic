import 'package:crud_task_apps/waterList.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Weather Info app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: watherInfo.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(

                  title: Text('City: ${watherInfo[index]['city']}'),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('temperature: ${watherInfo[index]['temperature']}⁰C'),
                      Text('condition: ${watherInfo[index]['condition']}'),
                      Text('humidity: ${watherInfo[index]['humidity']}%'),
                      Text('windSpeed: ${watherInfo[index]['windSpeed']} m/s'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
