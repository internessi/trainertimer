import 'dart:ui';
import 'package:flutter/material.dart';
import '/Locale/locales.dart';
import '../../MySubs/colors.dart';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';

class TimerDialog extends StatefulWidget {
  @override
  TimerDialogState createState() => new TimerDialogState();
}

class TimerDialogState extends State<TimerDialog> {
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
                    icon: Icon(Icons.chevron_left),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                titleSpacing: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.3),
                // Bereich Appbar
                title: Text(
                  ' ', //locale.workout!,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          child: Text("Vor".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  timerColorPrepBg),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[800]!.withOpacity(0.5)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                          color: Colors.grey[800]!
                                              .withOpacity(0.5),
                                          width: 3)))),
                          onPressed: () => null),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          child: Text("Akt".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  timerColorFightBg),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[800]!.withOpacity(0.5)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                          color: Colors.grey[800]!
                                              .withOpacity(0.5),
                                          width: 3)))),
                          onPressed: () => null),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          child: Text("Pau".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  timerColorPauseBg),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[800]!.withOpacity(0.5)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                          color: Colors.grey[800]!
                                              .withOpacity(0.5),
                                          width: 3)))),
                          onPressed: () => null),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          child: Text("Run".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[800]!.withOpacity(0.5)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(
                                          color: Colors.grey[800]!
                                              .withOpacity(0.5),
                                          width: 3)))),
                          onPressed: () => null),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
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
            SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {

                      },
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[800]!.withOpacity(0.5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              children: [

                                ElevatedButton(
                                    child: Text("0:05",
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),
                                    style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(
                                            timerColorPrepBg),
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.grey[800]!.withOpacity(0.5)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                    color: Colors.grey[800]!
                                                        .withOpacity(0.5),
                                                    width: 3)))),
                                    onPressed: () => null),
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                    child: Text("0:20",
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),
                                    style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(
                                            timerColorFightBg),
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.grey[800]!.withOpacity(0.5)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                    color: Colors.grey[800]!
                                                        .withOpacity(0.5),
                                                    width: 3)))),
                                    onPressed: () => null),
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                    child: Text("0:10",
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),
                                    style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(
                                            timerColorPauseBg),
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.grey[800]!.withOpacity(0.5)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                    color: Colors.grey[800]!
                                                        .withOpacity(0.5),
                                                    width: 3)))),
                                    onPressed: () => null),
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                    child: Text("12".toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 20, fontWeight: FontWeight.bold)),
                                    style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(
                                            Colors.grey),
                                        backgroundColor: MaterialStateProperty.all<Color>(
                                            Colors.grey[800]!.withOpacity(0.5)),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(
                                                    color: Colors.grey[800]!
                                                        .withOpacity(0.5),
                                                    width: 3)))),
                                    onPressed: () => null),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
