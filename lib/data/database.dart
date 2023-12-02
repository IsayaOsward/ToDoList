// ignore_for_file: non_constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  final MyBox = Hive.box('mybox');

  void initializedata() {
    toDoList = [
      ["Make tutorial", false],
      ["Do exercise", false]
    ];
  }

  void loadData() {
    toDoList = MyBox.get("TODOLIST");
  }

  void updatedata() {
    MyBox.put("TODOLIST", toDoList);
  }
}
