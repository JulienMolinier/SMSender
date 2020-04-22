import 'package:flutter/material.dart';
import 'package:smssender/pages/sms.dart';

import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Sender',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Home'),
      routes: {
        'home': (context) => MyHomePage(),
        'sms': (context) => SmsPage(),
      },
    );
  }
}
