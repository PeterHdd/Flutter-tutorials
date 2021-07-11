import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/counter_view_model.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterViewModel>(
      create: (BuildContext context) =>  CounterViewModel(),
      child: MaterialApp(
        title: 'Flutter Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Provider Tutorial'),
      ),
    );
  }
}
