import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("TO DO LIST",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
    );
  }
}