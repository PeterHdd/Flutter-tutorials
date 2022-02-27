import 'dart:convert';

import 'package:bloc_tutorial/model/data.dart';
import 'package:http/http.dart' as http;

class TodoService {
  Future<List<Data>> fetchData() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => Data.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
