import 'package:flutter/foundation.dart';
import 'package:todolist/Services/todolist_service.dart';
import 'package:todolist/models/todolist.dart';

class TodolistProvider extends ChangeNotifier {
  TodolistModel? model;

  Future<void> get() async {
    model = await ToDoListService.get();
    notifyListeners();
  }

  Future<void> post({
    required String title,
    required String description,
  }) async {
    await ToDoListService.post(title: title, description: description);
    await get();
  }

  Future<void> put({required String title, required int id}) async {
    await ToDoListService.put(title: title, id: id);
    await get();
  }

  Future<void> delete({required int id}) async {
    await ToDoListService.delete(id: id);
    await get();
  }
}
