
import 'package:flutter/material.dart';
void main (){
  runApp(SimpleApp());
}

class SimpleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
        title: Text( 'Counter',), centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Text('You pressed the button ',),
            Text(_counter.toString()+' times', style: TextStyle( fontWeight:  FontWeight.bold),),
            RaisedButton(
              onPressed:() {setState(() {_counter++; } );   },
              color: Colors.black38,
              child: Text('press', style: TextStyle(color: Colors.white),),
            )  ,
          ],
        ),
        margin: EdgeInsets.all(80),
      ),
    );
  }
}
