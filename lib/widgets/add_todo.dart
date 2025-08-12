import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_game/main.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({super.key});

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final nameController = TextEditingController();
  final pointsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Todo name"),
          ),
          TextField(
            controller: pointsController,
            decoration: InputDecoration(labelText: "Reward"),
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () =>
                  appState.addTodo(context, nameController, pointsController),
              child: Text("Add Todo"),
            ),
          ),
        ],
      ),
    );
  }
}
