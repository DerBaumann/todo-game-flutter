import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_game/main.dart';
import 'package:todo_game/widgets/add_todo.dart';
import 'package:todo_game/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showAddTodo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: AddTodoForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // onPressed: showAddTodo,
        onPressed: () => showAddTodo(),
        tooltip: "Add Todo",
        child: Icon(Icons.add),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (appState.todos.isEmpty)
            Text("No Todos!")
          else
            ...appState.todos.map((todo) => TodoItem(todo: todo)),
        ],
      ),
    );
  }
}
