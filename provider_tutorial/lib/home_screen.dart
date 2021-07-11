import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/counter_view_model.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterViewModel>(builder: (context, viewModel, child) {
              return Text(
                '${viewModel.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Provider.of<CounterViewModel>(context,listen: false).incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
