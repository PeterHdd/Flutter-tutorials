import 'package:flutter/material.dart';
import 'package:navigating_tutorial/generate_route_page.dart';
import 'package:navigating_tutorial/named_route_page.dart';
import 'package:navigating_tutorial/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/named-route': (context) => NamedRoutePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/generate-route") {
          final String arguments = settings.arguments as String;
          return MaterialPageRoute(
              builder: (context) => GenerateRoutePage(value: arguments));
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
      title: 'Navigation Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            ElevatedButton(
              child: Text("Navigate to Second Page"),
              onPressed: (() async {
                result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(page: "second page")),
                );
                setState(() {});
              }),
            ),
            ElevatedButton(
              child: Text("Navigate to Named Route"),
              onPressed: (() {
                Navigator.pushNamed(context, "/named-route",
                    arguments: "Named Route Page");
              }),
            ),
            ElevatedButton(
              child: Text("Navigate to Generated Route"),
              onPressed: (() {
                Navigator.pushNamed(context, "/generate-route",
                    arguments: "Generate Route");
              }),
            ),
            Text(result ?? ""),
          ])),
    );
  }
}
