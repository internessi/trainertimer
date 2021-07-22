import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '/Locale/locales.dart';



class HiveTest extends StatefulWidget {
  @override
  HiveTestState createState() => new HiveTestState();
}

class HiveTestState extends State<HiveTest> {
  late Key key;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: AppBar(
                leading: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.save_alt),
                    iconSize: 30,
                    onPressed: () {
                      print('speichern');
                    }),
                titleSpacing: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.3),
                title: Text(
                  ' ', //locale.workout!,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                actions: [

                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      backgroundColor: Colors.white10, // keine Auswirkung

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/bg1.png",
                fit: BoxFit.cover,
              ),

            ),
            MaterialApp(
              title: 'Hive Tutorial',
              home: FutureBuilder(
                future: Hive.openBox(
                  'contacts',
                  compactionStrategy: (int total, int deleted) {
                    return deleted > 20;
                  },
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError)
                      return Text(snapshot.error.toString());
                    else
                      return Scaffold();
                  } else
                    return Scaffold();
                },
              ),
            ),



          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    Hive.box('contacts').compact();
    Hive.close();
    super.dispose();
  }
}
