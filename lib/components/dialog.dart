// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:todo_list/components/buttons.dart';

class DialogBox extends StatelessWidget {
  final MyController;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.MyController,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: MyController,
              decoration: InputDecoration(
                hintText: "Add a new task",
                border: OutlineInputBorder()),
                
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButtons(text: 'Save', onPressed: onSave),
                SizedBox(width: 10),
                //cancel button
                MyButtons(text: 'Cancel', onPressed: onCancel)
              ],
            ),
          ],
        ),

      ),
    );
  }
}