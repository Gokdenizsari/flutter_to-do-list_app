import 'dart:js';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_list_app/models/task_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Task> _allTaks;
  @override
  void initState() {
    super.initState();
    _allTaks = <Task>[];
    _allTaks.add(Task.create(name: "Try Task", createdAt: DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: GestureDetector(
            onTap: () {
              _showAddTaskBottom(context);
            },
            child: Text(
              "What will you do today?",
              style: TextStyle(color: Colors.black),
            ),
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
        body: _allTaks.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) {
                  var _listEleman = _allTaks[index];
                  return Dismissible(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        SizedBox(width: 6),
                        Text("Task Deleted"),
                      ],
                    ),
                    key: Key(_listEleman.id),
                    onDismissed: (direction) {
                      _allTaks.remove(index);
                      setState(() {});
                    },
                    child: ListTile(
                      title: Text(_listEleman.name + " " + _listEleman.id),
                      subtitle: Text(_listEleman.createdAt.toString()),
                    ),
                  );
                },
                itemCount: _allTaks.length,
              )
            : Center(
                child: Text("Add to do Task"),
              ));
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
                onSubmitted: (value) {
                  Navigator.of(context).pop();
                  if (value.length > 2) {
                    DatePicker.showTimePicker(context, showSecondsColumn: false,
                        onConfirm: (time) {
                      var newAddToBeTask =
                          Task.create(name: value, createdAt: time);
                      _allTaks.add(newAddToBeTask);
                      setState(() {});
                    });
                  }
                },
              ),
            ),
          );
        });
  }
}
