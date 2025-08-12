import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_game/main.dart';
import 'package:todo_game/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            todo.checked ? Icons.check_circle : Icons.radio_button_unchecked,
          ),
          color: todo.checked ? Colors.green : Colors.grey,
          onPressed: () => appState.toggleTodo(todo.name),
        ),
        title: Text(
          todo.name,
          style: TextStyle(
            decoration: todo.checked ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Badge(
          label: Text("${todo.points}p"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          textColor: Theme.of(context).colorScheme.inverseSurface,
        ),
        onTap: () => todo.checked
            ? appState.deleteTodo(todo.name)
            : appState.toggleTodo(todo.name),
      ),
    );
  }
}
