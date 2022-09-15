import 'package:flutter_to_do_list_app/models/task_model.dart';

abstract class LocalStorage {
  Future<void> addTasl({required Task task});
  Future<Task> getTask({required String id});
  Future<List<Task>> getAllTask();
  Future<bool> deleteTask({required Task task});
  Future<Task> updateTask({required Task task});
}

 class HiveLocalStroge extends LocalStorage {
  @override
  Future<void> addTask({required Task task}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTask({required Task task}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTask() {
    throw UnimplementedError();
  }

  @override
  Future<Task> getTask({required String id}) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> addTasl({required Task task}) {
    
    throw UnimplementedError();
  }
  
  @override
  Future<Task> updateTask({required Task task}) {
    
    throw UnimplementedError();
  }
}
