import 'package:appunificada/database/sqlfite_database.dart';
import 'package:appunificada/models/task_model.dart';
import 'package:flutter/material.dart';


class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  TaskProvider() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    _tasks = await _databaseHelper.getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    final newTask = Task(title: title);
    await _databaseHelper.insertTask(newTask);
    _loadTasks();
  }

  Future<void> updateTask(Task task) async {
    final updatedTask = Task(id: task.id, title: task.title, isCompleted: !task.isCompleted);
    await _databaseHelper.updateTask(updatedTask);
    _loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await _databaseHelper.deleteTask(id);
    _loadTasks();
  }
}
