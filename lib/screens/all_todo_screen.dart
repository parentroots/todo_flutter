import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../entities/todo.dart';
import '../widget/todo_list_tiles.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key, required this.todoList});

   final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
          itemCount: todoList.length,
          itemBuilder: (context,index){

          final todo=todoList[index];

        return Slidable(

          key: UniqueKey(),
          startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children:[

                SlidableAction(onPressed:  (context) {
                  print("Delete tapped");
                },
                icon: Icons.delete,
                  label: "Delete Item",
                  backgroundColor: Colors.redAccent,
                 borderRadius: BorderRadius.circular(10),
                  spacing: 2,
                ),

                SlidableAction(onPressed:  (context) {
                  print("share tapped");
                },
                  borderRadius: BorderRadius.circular(10),
                  icon: Icons.share,
                  label: "Share Item",
                  backgroundColor: Colors.green.shade200,
                  spacing: 2,
                )


              ]
          ),

          child: Card(
            color: Colors.blue,
            elevation: 10,
            child: todoListTiles(todo: todo,),

          ),
        );
      }),

    );
  }
}

