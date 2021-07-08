import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Components/colorButton.dart';
import '/Locale/locales.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class AddAlarm extends StatefulWidget {
  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          locale.setAlarm!,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 24,
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 4.0, sigmaY: 4.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                currentIndex = index;
                                              });
                                            },
                                            child: Text(
                                                index > 12
                                                    ? (index - 12)
                                                            .toString()
                                                            .padLeft(2, '0') +
                                                        " : 00  pm"
                                                    : index == 12
                                                        ? index
                                                                .toString()
                                                                .padLeft(
                                                                    2, '0') +
                                                            " : 00  pm"
                                                        : index
                                                                .toString()
                                                                .padLeft(
                                                                    2, '0') +
                                                            " : 00  am",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                        fontSize: 35,
                                                        color: currentIndex ==
                                                                index
                                                            ? Colors.white
                                                            : darkGrey)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[800]!.withOpacity(0.5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(locale.days!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: darkGrey,
                                        )),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: DaysSelector(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[800]!.withOpacity(0.5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(locale.label!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: darkGrey,
                                        )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(locale.itsWorkoutTime!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 12))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[800]!.withOpacity(0.5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(locale.alarmRingtone!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          color: darkGrey,
                                        )),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(locale.alarmClock!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(fontSize: 12)),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: FadedScaleAnimation(
                                ColorButton(locale.setAlarm),
                                durationInMilliseconds: 1000,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DaysSelector extends StatefulWidget {
  @override
  _DaysSelectorState createState() => _DaysSelectorState();
}

class _DaysSelectorState extends State<DaysSelector> {
  List values = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List days = [
    "M",
    "T",
    "W",
    "T",
    "F",
    "S",
    "S",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                values[index] = !values[index];
              });
            },
            child: FadedScaleAnimation(
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: values[index] ? buttonColor : Colors.grey[800]),
                child: Center(
                  child: Text(days[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 13)),
                ),
              ),
              durationInMilliseconds: 1000,
            ),
          );
        },
      ),
    );
  }
}
