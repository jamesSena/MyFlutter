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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Minha primeira aplicação com Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
   
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quantidade de clicks:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
