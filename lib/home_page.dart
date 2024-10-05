import 'package:flutter/material.dart';
import 'package:todo_app/dialog_box.dart';

import 'tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // todo List
  List toDoList = [
    ["Home Work", false],
    ["go to gym", false],
  ];

  // check box
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // text controller
  final _controller = TextEditingController();

  // save new tast
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }
//delete task
  void deleteTask(int index){
setState(() {
  toDoList.removeAt(index);
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text('TO DO'),
        backgroundColor: Colors.yellow,
      ),

      // floating button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: toDoList[index][0],deleteFunction: (context) => deleteTask(index),
                onChanged: (value) => checkBoxChanged(value, index),
                taskCompleted: toDoList[index][1]);

          }),
    );
  }
}
