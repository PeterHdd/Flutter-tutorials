import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'todo_bloc_observer.dart';

void main() async {
  Bloc.observer = TodoBlocObserver();
  runApp(const App());
}
