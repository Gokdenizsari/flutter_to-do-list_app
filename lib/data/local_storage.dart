import 'package:flutter_to_do_list_app/models/task_model.dart';

abstract class LocalStorage {
  Future<void> addTasl({required Task task});
  Future<Task> getTask({required String id});
  Future<List<Task>> getAllTask();
  Future<bool> deleteTask({required Task task});
  Future<Task> updateTask({required Task task});
}
