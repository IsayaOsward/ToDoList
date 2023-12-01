// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:todo_list/components/dialog.dart';
import 'package:todo_list/components/todo_tile.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList=[
    ["Make tutorial",false],
    ["Do exercise", true]
    ];

  void checkBoxChanged(bool? value, int index)
  {
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }
  final controller = TextEditingController(
    
  );
  void SaveNewTask()
  {
    setState(() {
      toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask()
  {
    showDialog(context: context, builder: (context)
    {
        return DialogBox(
          MyController: controller,
          onSave: SaveNewTask,
          onCancel: ()=> Navigator.of(context).pop(),
        );
    });
  }
  void DeleteFunction(int index)
  {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("To Do",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index)
        {
          return ToDOTile(
            taskname: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value)=> checkBoxChanged(value,index),
            deletetask: (context) => DeleteFunction(index),
          );
        },
        ),
    );
  }
}