import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smssender/widgets/appdrawer.dart';

import '../widgets/myform.dart';

class SmsPage extends StatefulWidget {
  SmsPage({Key key, this.title}) : super(key: key);
  final String title;
  static const String routeName = '/sms';

  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  MyCustomFormState formState = MyCustomFormState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS"),
      ),
      drawer: AppDrawer(),
      body: MyCustomForm(),
    );
  }
}
