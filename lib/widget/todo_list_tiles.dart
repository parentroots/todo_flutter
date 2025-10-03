import 'package:flutter/material.dart';
import '../entities/todo.dart';
class todoListTiles extends StatefulWidget {
  final Todo todo;
  const todoListTiles({super.key, required this.todo});

  @override
  State<todoListTiles> createState() => _todoListTilesState();
}

class _todoListTilesState extends State<todoListTiles> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.todo.title, style: TextStyle(color: Colors.white, fontSize: 24)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.todo.description,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            widget.todo.dateTime.toString(),
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),


      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _bottomSheetDialog,
              child: CircleAvatar(child: Icon(Icons.edit_note),)),
          SizedBox(width: 6,),
          GestureDetector(
            child: CircleAvatar(
              child: Icon(Icons.check),),
          )
        ],
      ),

    );
  }



  void _bottomSheetDialog() {
    TextEditingController titleController =
    TextEditingController(text: widget.todo.title);
    TextEditingController descController =
    TextEditingController(text: widget.todo.description);

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Update Todo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                child: Text("Update"),
                onPressed: () {
                  setState(() {
                    widget.todo.title = titleController.text;
                    widget.todo.description = descController.text;
                  });
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }


}
