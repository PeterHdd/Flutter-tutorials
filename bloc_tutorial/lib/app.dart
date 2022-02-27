import 'package:bloc_tutorial/features/todo/bloc/todo_bloc.dart';
import 'package:bloc_tutorial/features/todo/todo_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/todo/todo_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bloc Tutorial",
      home: BlocProvider(
        create: (context) => TodoBloc(TodoRepositoryImpl()),
        child: const TodoNameView(),
      ),
    );
  }
}
