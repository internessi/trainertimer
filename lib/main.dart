import 'package:flutter/material.dart';
import 'db_helper.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sqflite Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () async {
                  int i = await DatabaseHelper.instance
                      .insert({DatabaseHelper.columnName: 'Frank'});
                  print('the inserted id is: $i');
                },
                child: Text('insert'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[400])),
              ),
              TextButton(
                onPressed: () async {
                  List<Map<String, dynamic>> queryRows =
                      await DatabaseHelper.instance.queryAll();
                  print(queryRows);
                },
                child: Text('query'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              ),
              TextButton(
                onPressed: () async {
                  int updateRowsAffected = await DatabaseHelper.instance
                      .update({
                    DatabaseHelper.columnID: 3,
                    DatabaseHelper.columnName: 'Mark'
                  });
                  print(updateRowsAffected);
                },
                child: Text('update'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[100])),
              ),
              TextButton(
                onPressed: () async {
                  int deleteRowsAffected =
                      await DatabaseHelper.instance.delete(3);
                  print(deleteRowsAffected);
                },
                child: Text('delete'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[300])),
              ),
            ],
          ),
        ));
  }
}
