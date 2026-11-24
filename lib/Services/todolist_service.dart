import 'package:dio/dio.dart';
import 'package:todolist/models/todolist.dart';

class ToDoListService {
  static Dio dio = Dio();

  static Future<TodolistModel> get() async {
    try {
      Response response = await dio.get(
        "https://mytodoapi.runasp.net/api/TodoItems/",
      );
      return TodolistModel.fromJson(response.data);
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (other) {
      throw Exception(other.toString());
    }
  }

  static Future<void> post({
    required String title,
    required String description,
  }) async {
    try {
      await dio.post(
        "https://mytodoapi.runasp.net/api/TodoItems/",
        data: {"title": title, "description": description},
      );
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (other) {
      throw Exception(other.toString());
    }
  }

  static Future<void> put({required String title, required int id}) async {
    try {
      await dio.put(
        "https://mytodoapi.runasp.net/api/TodoItems/$id",
        data: {"title": title},
      );
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (other) {
      throw Exception(other.toString());
    }
  }

  static Future<void> delete({required int id}) async {
    try {
      await dio.delete("https://mytodoapi.runasp.net/api/TodoItems/$id");
    } on DioException catch (dioerror) {
      throw Exception(dioerror.message);
    } catch (other) {
      throw Exception(other.toString());
    }
  }
}
