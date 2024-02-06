import 'package:crud_task_apps/task_list_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 22,
            ),
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}
