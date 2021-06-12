import 'package:flutter/material.dart';
import 'package:flutter/src/material/navigation_rail.dart';
import 'db_helper.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sqflite Example'),
        ),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.access_alarm),
                  label: Text('Alarm'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  label: Text('Bookmark'),
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              width: (MediaQuery.of(context).size.width - 72),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
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
            ),
          ],
        ));
  }
}
