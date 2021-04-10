import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String page;
  SecondPage({required this.page});
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
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
              Text(widget.page)
            ]),
      ),
    );
  }
}
