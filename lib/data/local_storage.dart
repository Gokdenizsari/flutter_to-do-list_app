import 'package:flutter_to_do_list_app/models/task_model.dart';
import 'package:hive/hive.dart';

abstract class LocalStorage {
  Future<void> addTasl({required Task task});
  Future<Task?> getTask({required String id});
  Future<List<Task>> getAllTask();
  Future<bool> deleteTask({required Task task});
  Future<Task> updateTask({required Task task});
}

class MockLocalStorage extends LocalStorage {
  @override
  Future<void> addTasl({required Task task}) {
    // TODO: implement addTasl
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTask({required Task task}) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTask() {
    // TODO: implement getAllTask
    throw UnimplementedError();
  }

  @override
  Future<Task> getTask({required String id}) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<Task> updateTask({required Task task}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}

class HiveLocalStroge extends LocalStorage {
  late Box<Task> _taskBox;

  HiveLocalStroge() {
    _taskBox = Hive.box<Task>("Tasks");
  }

  @override
  Future<void> addTask({required Task task}) async {
    await _taskBox.put(task.id, task);
  }

  @override
  Future<bool> deleteTask({required Task task}) async {
    await task.delete();
    return true;
  }

  @override
  Future<List<Task>> getAllTask() async {
    List<Task> _allTask = <Task>[];
    _allTask = _taskBox.values.toList();
    if (_allTask.length > 0) {
      _allTask.sort((Task a, Task b) => a.createdAt.compareTo(b.createdAt));
    }
    return _allTask;
  }

  @override
  Future<Task?> getTask({required String id}) async {
    if (_taskBox.containsKey(id)) {
      return _taskBox.get(id);
    } else {
      return null;
    }
  }

  @override
  Future<void> addTasl({required Task task}) {
    throw UnimplementedError();
  }

  @override
  Future<Task> updateTask({required Task task}) async {
    await task.save();
    return task;
  }
}
