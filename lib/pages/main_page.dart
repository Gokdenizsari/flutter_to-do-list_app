import 'dart:js';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "What will you do today?",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
              onPressed: () {
                _showAddTaskBottom(context);
              },
              icon: Icon(Icons.add)),
        ],
      ),
    );
  }

  void _showAddTaskBottom(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              title: TextField(
                style: TextStyle(fontSize: 21),
                decoration: InputDecoration(
                    hintText: "What is it you want to do?",
                    border: InputBorder.none),
              ),
            ),
          );
        });
  }
}
