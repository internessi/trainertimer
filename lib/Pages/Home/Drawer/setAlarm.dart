import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import '/Pages/Home/Drawer/addAlarm.dart';
import '/Pages/Home/Drawer/drawer.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class SetAlarm extends StatefulWidget {
  @override
  _SetAlarmState createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  List time = [
    "07:00 am",
    "08:10 am",
    "07:00 am",
  ];

  List values = [true, true, false];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    List caption = [
      locale.itsWorkoutTime,
      locale.healthyFood,
      locale.eveningWalk
    ];
    List subtitle = [
      locale.everyday,
      locale.mon! + ", " + locale.tue! + ", " + locale.wed! + ", " + locale.thr!,
      locale.mon! + ", " + locale.tue! + ", " + locale.wed! + ", " + locale.thr!,
    ];

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(locale.alarms!,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17)),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      drawer: MyDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/bg.png",
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey[800]!.withOpacity(0.5)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(time[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  fontSize: 20,
                                                  color: values[index]
                                                      ? Colors.white
                                                      : darkGrey)),
                                      Container(
                                        height: 20,
                                        child: Switch(
                                          inactiveTrackColor: Colors.grey[200],
                                          inactiveThumbColor: darkGrey,
                                          activeTrackColor: Colors.grey[200],
                                          value: values[index],
                                          activeColor: buttonColor,
                                          onChanged: (value) {
                                            setState(() {
                                              values[index] = value;
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(subtitle[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 11,
                                              color: values[index]
                                                  ? darkGrey
                                                  : Colors.grey[700])),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(caption[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: values[index]
                                                      ? Colors.white
                                                      : darkGrey)),
                                      Icon(
                                        Icons.more_vert,
                                        color: greyColor,
                                        size: 20,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 30,
              child: FadedScaleAnimation(
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddAlarm()));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                durationInMilliseconds: 1000,
              ),
            )
          ],
        ),
      ),
    );
  }
}
