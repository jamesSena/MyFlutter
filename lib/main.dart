import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeiro APP com Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("Oi"),
        title: Text("Todo List"),
        actions: <Widget>[
          Icon(Icons.plus_one)
        ],
      ),
      body: Container(
        child: Center(
          child: Text("Olá Mundo")
          ),
      ),
    );
  }
}
