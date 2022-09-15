import 'package:flutter/material.dart';
import 'package:flutter_to_do_list_app/data/local_storage.dart';
import 'package:flutter_to_do_list_app/main.dart';
import 'package:flutter_to_do_list_app/models/task_model.dart';
import 'package:intl/intl.dart';

class TaskItem extends StatefulWidget {
  Task task;

  TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  TextEditingController _taskNameController = TextEditingController();
  late LocalStorage _localStorage;

  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
    _taskNameController.text = widget.task.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 11),
        ],
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.task.isCompleted = !widget.task.isCompleted;
            _localStorage.updateTask(task: widget.task);
            setState(() {});
          },
          child: Container(
            child: Icon(Icons.check),
            decoration: BoxDecoration(
                color: widget.task.isCompleted ? Colors.green : Colors.white,
                border: Border.all(color: Colors.grey, width: 0.7),
                shape: BoxShape.circle),
          ),
        ),
        title: widget.task.isCompleted
            ? Text(
                widget.task.name,
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            : TextField(
                minLines: 1,
                maxLines: null,
                textInputAction: TextInputAction.done,
                controller: _taskNameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                onSubmitted: (newValue) {
                  if (newValue.length > 2) {
                    widget.task.name = newValue;
                    _localStorage.updateTask(task: widget.task);
                  }
                },
              ),
        trailing: Text(
          DateFormat("hh:mm a").format(widget.task.createdAt),
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
