import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';

const TodoListKey = 'todo_list';

class TodoRepository {

  // TodoRepository() {
  //   // O uso do Shared Preferences é assíncrono, mas como não se pode tornar
  //   // o construtor assíncrono, usa-se o .then
  //   SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  // }

  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(TodoListKey) ?? '[]';
    final List jsonDecoded = jsonDecode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos) {
    final String jsonString = json.encode(todos);
    sharedPreferences.setString(TodoListKey, jsonString);
  }

}