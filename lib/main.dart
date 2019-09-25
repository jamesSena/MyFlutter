import 'package:flutter/material.dart';

import 'models/Item.dart';

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

class MyHomePage extends StatefulWidget {
var items = new List<Item>();

  MyHomePage(){
    items = [];
    items.add(Item(title:"Banana 1",done: false));
    items.add(Item(title:"Abacate 2",done: true));
    items.add(Item(title:"Limao 3",done: false));
  }
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index){
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value:item.done,
            onChanged: (value){

            },
          );
        },
      ),
    );
  }
}
