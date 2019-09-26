import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // items.add(Item(title:"Banana",done: false));
    // items.add(Item(title:"Abacate 2",done: true));
    // items.add(Item(title:"Limao 3",done: false));
  }
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(){
    load();
  }

  var newTaskController = TextEditingController();

  void add(){
    if(newTaskController.text.isEmpty) return;
    setState(() {
     widget.items.add(
       Item(
         title: newTaskController.text,
         done: false
       )
     );
     newTaskController.text = ""; 
     save();
    });
  }
  void remove(int index){
    setState(() {
     widget.items.removeAt(index); 
    });
    save();
  }
  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if(data != null){
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
      setState(() {
       widget.items = result; 
      });
    }

  }
  save() async{
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Text("Oi"),
        title: TextFormField(
          controller: newTaskController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24),
            decoration: InputDecoration(
              labelText: "Nova Tarefa",
              labelStyle: TextStyle(
                color: Colors.white
              )
            ),
        ),
        
        actions: <Widget>[
          Icon(Icons.plus_one)
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index){
          final item = widget.items[index];
          return Dismissible(
            background: Container(
              color: Colors.red,
              child: Text("Excluir")
            ),
            key:  Key(item.title.toString()),
            child: CheckboxListTile(
              title: Text(item.title),
              value:item.done,
              onChanged: (value){
                print("Teste:  $value");
                setState(() {//Attualizando o item
                  item.done = value;
                  save();

                });
              },
            ),
            onDismissed: (direction){
              remove(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),    
    );
  }
}
