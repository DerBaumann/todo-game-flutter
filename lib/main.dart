import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_game/config/config.dart';
import 'package:todo_game/models/todo.dart';
import 'package:todo_game/screens/layout.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AppState(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Layout(),
    );
  }
}

class AppState extends ChangeNotifier {
  List<Todo> todos = [
    Todo("Buy Milk", 100),
    Todo("Learn Flutter", 200),
    Todo("Make Money", 200),
    Todo("Smoke Weed", 420),
    Todo("Cook Food", 150),
  ];

  int _points = 0;

  int get points => _points;

  void addTodo(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController pointsController,
  ) {
    final name = nameController.text.trim();
    final points = int.tryParse(pointsController.text.trim()) ?? 0;

    switch (name.isEmpty) {
      case true:
        print("Name is empty!");

      case false:
        todos.add(Todo(name, points));

        nameController.clear();
        pointsController.clear();

        Navigator.of(context).pop();

        notifyListeners();
    }
  }

  void toggleTodo(String name) {
    for (var todo in todos) {
      if (todo.name == name) {
        todo.toggle();
      }
    }

    notifyListeners();
  }

  void deleteTodo(String name) {
    _points += todos
        .where((todo) => todo.name == name)
        .fold(0, (acc, todo) => acc + todo.points);
    todos = todos.where((todo) => todo.name != name).toList();
    notifyListeners();
  }
}
