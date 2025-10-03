import 'package:flutter/material.dart';

import '../entities/todo.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [


            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),


            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: _addNewTodo,
              child: const Text("Save"),
            ),



          ],
        ),
      ),
    );
  }



  void _addNewTodo() {
    if (_titleController.text.isNotEmpty) {
      Navigator.pop(
        context,
        Todo(_titleController.text, _descController.text,DateTime.now()),
      );
    }
  }





}
