import 'package:flutter_todo/todo/todo.model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TodoService {
  String URL = 'http://localhost:3000/todo';

  Future<List<Todo>> listAll() async {
    http.Response response = await http.get(URL);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Iterable list = convert.json.decode(response.body);
      return list.map((i) => Todo.fromJson(i)).toList();
    }
  }

  Future<bool> create(String description) async {
    http.Response response =
        await http.post(URL, body: {'description': description});
    return (response.statusCode == 200 || response.statusCode == 201);
  }

  Future<bool> remove(int id) async {
    http.Response response = await http.delete('${URL}/${id}');
    return (response.statusCode == 200 || response.statusCode == 201);
  }

  Future<bool> update(Todo _todo) async {
    http.Response response = await http.put('${URL}', body: {
      'id': _todo.id.toString(),
      'description': _todo.description,
      'done': _todo.done.toString()
    });
    return (response.statusCode == 200 || response.statusCode == 201);
  }
}
