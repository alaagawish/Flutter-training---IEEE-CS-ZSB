import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List task = List();

  @override
  void initState() {
    super.initState();
    task.add("task");
    task.add("task");
    task.add("task");
    task.add("task");
  }

  String newTask = "";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Tasks',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 35,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  // title: Text("Add a new task"),
                  content: TextField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: 'Enter your task'),
                    onChanged: (String s) {
                      newTask = s;
                    },
                  ),

                  actions: [
                    FlatButton(
                      child: Text(
                        "Add",
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          if (newTask != "") {
                            task.add(newTask);
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: Text(
                                        "It's empty",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      actions: [
                                        FlatButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ]);
                                });
                          }
                        });
                      },
                    ),
                    FlatButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                  contentPadding: EdgeInsets.all(33),
                );
              },
            );
          },
        ),
        body: ListView.builder(
            itemCount: task.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(task[index]),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(task[index]),
                        // subtitle: Text(DateTime.now().toString()),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              task.removeAt(index);
                            });
                          },
                        ),
                      )));
            }));
  }
}
