import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String message = "";

  void _sendSMS(List<String> recipients) async {
    String _result = await sendSMS(message: message, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  Future<void> _getParameters() async {
    List<String> recipients = [];
    File file = await FilePicker.getFile(type: FileType.any);
    final input = file.openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
    fields.forEach((value) => {recipients.add("0" + value[0].toString())});
    _sendSMS(recipients);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(30),
              child: TextFormField(
                maxLength: 160,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your message';
                  } else {
                    message = value;
                  }
                  return null;
                },
              )),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: FloatingActionButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _getParameters();
                          }
                        },
                        child: IconButton(icon: Icon(Icons.send)),
                      ))))
        ]));
  }
}
