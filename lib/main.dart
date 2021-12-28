import 'package:bytebank_dashboard/http/web_client.dart';
import 'package:bytebank_dashboard/models/contact.dart';
import 'package:bytebank_dashboard/models/transaction.dart';
import 'package:bytebank_dashboard/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DashBoard(),
    );
  }
}
