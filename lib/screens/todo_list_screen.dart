import 'package:flutter/material.dart';
import 'package:todo_project/screens/add_new_todo_screen.dart';
import 'package:todo_project/screens/all_todo_screen.dart';

import '../entities/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {


  List<Todo>todos=[];



  void _addNewTodo(Todo todo) {
    setState(() {
      todos.add(todo);
    });
  }



  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(


        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()async {
            final newTodo = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddTodoScreen()));

            if (newTodo != null) {
              _addNewTodo(newTodo);
            }

        },
          label: Text("Add New Todo"),
          icon: Icon(Icons.add),),
        
        
        
        appBar: AppBar(
          title: Text("Todo List"),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            dividerColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
            Text("All Todo"),
            Text("Done Todo"),
            Text("UnDone Todo")
            
          ]),
          
        ),
      
      body: TabBarView(children: [
        AllTodoScreen(todoList: todos),

        AllTodoScreen(todoList:todos),

        AllTodoScreen(todoList: todos),


      ]),
      
      
      ),
    );
  }
}
