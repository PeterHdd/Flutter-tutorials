import 'package:flutter/material.dart';

class GenerateRoutePage extends StatefulWidget {
  final String value;
  GenerateRoutePage({Key? key, required this.value}) : super(key: key);

  @override
  _GenerateRoutePageState createState() => _GenerateRoutePageState();
}

class _GenerateRoutePageState extends State<GenerateRoutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Generate Route"),
      ),
            body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("go back!"),
                onPressed: (() {
                  Navigator.pop(context,"first page");
                }),
              ),
              Text(widget.value)
            ]),
      ),
    );
  }
}