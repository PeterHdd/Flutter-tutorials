import 'package:bloc_tutorial/features/Todo/todo_service.dart';
import 'package:bloc_tutorial/model/data.dart';


class TodoRepositoryImpl implements TodoRepository {

  TodoService service = TodoService();

  @override
  Future<List<Data>> fetchData() {
    return service.fetchData();
  }

}

abstract class TodoRepository {
  Future<List<Data>> fetchData();
}
