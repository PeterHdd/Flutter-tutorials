import 'package:flutter/material.dart';

class NamedRoutePage extends StatefulWidget {
  NamedRoutePage({Key? key}) : super(key: key);

  @override
  _NamedRoutePageState createState() => _NamedRoutePageState();
}

class _NamedRoutePageState extends State<NamedRoutePage> {
  @override
  Widget build(BuildContext context) {
    final String arguments = ModalRoute.of(context)!.settings.arguments as String;
    
    return Scaffold(
        appBar: AppBar(
        title: Text("Named Route Page"),
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
              Text(arguments)
            ]),
      ),
    );
  }
}