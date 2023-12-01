// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDOTile extends StatelessWidget {
  String taskname;
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletetask;

  ToDOTile({super.key, 
  required this.taskname,
  required this.taskCompleted,
  required this.onChanged,
  required this.deletetask
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(onPressed: deletetask,
          icon: Icons.delete,
          borderRadius: BorderRadius.circular(12),
          backgroundColor: Colors.red.shade300),
        ]),
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,),
              Text(
                taskname,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}