import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/features/todo/todo_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/data.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;
  TodoBloc(this._todoRepository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
    try {
      List<Data> data = await _todoRepository.fetchData();
      emit(TodoLoaded(data: data));
    } on Exception {
      emit(TodoError(message: "Couldn't fetch the list, please try again later!"));
    }
    });
  }
}
