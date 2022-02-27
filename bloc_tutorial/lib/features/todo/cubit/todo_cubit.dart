import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/features/todo/todo_repository_impl.dart';
import 'package:bloc_tutorial/model/data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
    final TodoRepository _todoRepository;

  TodoCubit(this._todoRepository) : super(TodoInitial());

  Future<void> getData() async {
    try {
      List<Data> data = await _todoRepository.fetchData();
      emit(TodoLoaded(data: data));
    } on Exception {
      emit(TodoError(message: "Could not fetch the list, please try again later!"));
    }
  }
}
