import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/models/task_model.dart';

import 'screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
          child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blueAccent
        ),
        home: TaskScreen(),
      ),
    );
  }
}
