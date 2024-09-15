import 'package:flutter/material.dart';
import 'package:uidesign/modal/item.dart';

import 'Widget/CardBodyWidget.dart';
import 'Widget/ModalBottom.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];

  void handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  void handleAddTask(String name) {
    final newItems = (DataItems(id: DateTime.now().toString(), name: name));

    setState(() {
      items.add(newItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do List",
          style: TextStyle(fontSize: 40),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: items
              .map((item) => CardBody(
                    index: items.indexOf(item),
                    item: item,
                    handleDeleteTask: handleDeleteTask,
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            backgroundColor: Colors.grey[200],
            isScrollControlled: true,
            context: context,
            builder: (BuildContext content) {
              return ModalBottom(
                addTask: handleAddTask,
              );
            },
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
