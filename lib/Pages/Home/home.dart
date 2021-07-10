import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import '/Locale/locales.dart';
import '/Pages/Home/Drawer/setAlarm.dart';
import '/Pages/Home/workouts.dart';
import '/MyWidgets/ttCards.dart';
import 'Timers/timerSetup.dart';
import '/Pages/Home/Sub/sub.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

import 'Drawer/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List imgTimer = [
      "assets/imgs/Cropped/crop22.png"
    ];
    List typeTimer = ['Timer'];
    List lineTimer = ['Intervall, Runden, HITT, Tabatta, ...'];

    List imgFitness = [
      "assets/imgs/Cropped/crop21.png",
      "assets/imgs/Cropped/crop23.png"
    ];
    List typeFitness = [locale.beginner, locale.intermediate];

    List imgFight = [
      "assets/imgs/Cropped/crop11.png",
      "assets/imgs/Cropped/crop12.png",
      "assets/imgs/Cropped/crop13.png"
    ];
    List textFight = ['Warmup', 'BOXING', 'Muay Thai'];
    List typeFight = ['TRAINING', 'TRAINING', 'TRAINING'];



    return Scaffold(
      backgroundColor: scaffoldBg,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: AppBar(
                titleSpacing: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.3),
                title: Text(
                  locale.workout!,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.alarm_on,
                        color: greyColor,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetAlarm()));
                      })
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      drawer: MyDrawer(),
      body: FadedSlideAnimation(
        Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ListView(
                    children: [
                      SubListTitle (
                        locale.headline1!.toUpperCase() as String,
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerSetup(
                                      locale.chest, typeTimer[0])));
                        },
                        child:
                        TimerCard(locale.signIn),
                      ),
                      SizedBox(
                        height: 15,
                      ),



                      SubListTitle (
                        locale.headline2!.toUpperCase() as String,
                      ),
                      Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Workouts(
                                            locale.chest, typeFight[index])));
                              },
                              child:
                              TraierTimerCard(locale.signIn, imgFight[index], index),

                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      SubListTitle (
                        locale.headline3!.toUpperCase() as String,
                      ),
                      Container(
                        child:
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Workouts(locale.chest, typeFitness[index])));
                              },
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                  ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[800]!.withOpacity(0.3),
                                    ),
                                    margin: EdgeInsets.only(top: 15),
                                    height: 103,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        FadedScaleAnimation(
                                          Container(
                                            height: 110,
                                            child: Image.asset(
                                              imgFitness[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          durationInMilliseconds: 1000,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10, top: 7, left: 10),
                                                child: Row(
                                                  children: [
                                                    Spacer(),
                                                    Container(
                                                      height: 18,
                                                      child:
                                                      Image.asset(
                                                          "assets/imgs/ger1.png",
                                                          fit: BoxFit.scaleDown
                                                      ),
                                                    ),
                                                    SizedBox(width: 7),
                                                    Container(
                                                      height: 18,
                                                      child:
                                                      Image.asset(
                                                          "assets/imgs/uk1.png",
                                                          fit: BoxFit.scaleDown
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(locale.arm!.toUpperCase()),
                                                  Text(typeFitness[index].toUpperCase()),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "13 " + locale.workouts!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                        fontSize: 11,
                                                        color: darkGrey),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        beginOffset: Offset(0.4, 0),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
