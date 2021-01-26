import 'package:flutter/material.dart';
import 'package:local_db_sqf/db_healper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SQFLITE EXAMPLE"),
        ),
        body: Center(
          child: Column(
            children: [
              FlatButton(
                onPressed: () async {
                  int i = await DatabaseHelper.intance
                      .insert({DatabaseHelper.columnName: 'Amit'});
                  print('The inserted is $i');
                },
                child: Text(
                  "INSERT",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
              ),
              FlatButton(
                onPressed: () async {
                  int updatedId = await DatabaseHelper.intance.update({
                    DatabaseHelper.columnId: 12,
                    DatabaseHelper.columnName: 'Shirley',
                  });
                  print(updatedId);
                },
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
              FlatButton(
                  onPressed: () async {
                    int rowsEffected = await DatabaseHelper.intance.delete(13);
                    print(rowsEffected); 
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red),
              FlatButton(
                  onPressed: () async {
                    List<Map<String, dynamic>> queryRows =
                        await DatabaseHelper.intance.queryAll();
                    print(queryRows);
                  },
                  child: Text(
                    "query",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
