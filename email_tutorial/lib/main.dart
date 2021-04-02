import 'package:email_tutorial/components/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Email Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedBackPage(title: 'Feedback'),
    );
  }
}

class FeedBackPage extends StatefulWidget {
  FeedBackPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Form(
        key: _formKey,
        onChanged: (() {
          setState(() {
            _enableBtn = _formKey.currentState!.validate();
          });
        }),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFields(
                  controller: subjectController,
                  name: "Subject",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  })),
              TextFields(
                  controller: emailController,
                  name: "Email",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  })),
              TextFields(
                  controller: messageController,
                  name: "Message",
                  validator: ((value) {
                    if (value!.isEmpty) {
                      setState(() {
                        _enableBtn = true;
                      });
                      return 'Message is required';
                    }
                    return null;
                  }),
                  maxLines: null,
                  type: TextInputType.multiline),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5);
                            else if (states.contains(MaterialState.disabled))
                              return Colors.grey;
                            return Colors.blue; // Use the component's default.
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ))),
                    onPressed: _enableBtn
                        ? (() async {
                            final Email email = Email(
                              body: messageController.text,
                              subject: subjectController.text,
                              recipients: [emailController.text],
                              isHTML: false,
                            );

                            await FlutterEmailSender.send(email);
                          })
                        : null,
                    child: Text('Submit'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
