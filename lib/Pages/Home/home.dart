import 'dart:ui';

import 'package:animation_wrappers/animation_wrappers.dart';
import '/Locale/locales.dart';
import '/Pages/Home/Drawer/setAlarm.dart';
import '/Pages/Home/workouts.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

import 'Drawer/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List type = [locale.beginner, locale.intermediate, locale.advanced];
    List imgChest = [
      "assets/imgs/Cropped/crop11.png",
      "assets/imgs/Cropped/crop12.png",
      "assets/imgs/Cropped/crop13.png"
    ];
    List imgArms = [
      "assets/imgs/Cropped/crop21.png",
      "assets/imgs/Cropped/crop22.png",
      "assets/imgs/Cropped/crop23.png",
    ];

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
                  "assets/bg.png",
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Text(
                            locale.chest!.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: darkGrey, letterSpacing: 1),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            locale.workout!.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: darkGrey, letterSpacing: 1),
                          ),
                        ],
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
                                            locale.chest, type[index])));
                              },
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 4.0, sigmaY: 4.0),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 15),
                                    height: 103,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[800]!.withOpacity(0.3),
                                    ),
                                    child: Row(
                                      children: [
                                        FadedScaleAnimation(
                                          Container(
                                            height: 110,
                                            child: Image.asset(
                                              imgChest[index],
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
                                                    right: 10,
                                                    top: 7,
                                                    left: 10),
                                                child: Row(
                                                  children: [
                                                    Spacer(),
                                                    Icon(
                                                      Icons.show_chart,
                                                      color: buttonColor,
                                                      size: 15,
                                                    ),
                                                    Icon(
                                                      Icons.show_chart,
                                                      color: index == 1 ||
                                                              index == 2
                                                          ? buttonColor
                                                          : greyColor,
                                                      size: 15,
                                                    ),
                                                    Icon(
                                                      Icons.show_chart,
                                                      color: index == 2
                                                          ? buttonColor
                                                          : greyColor,
                                                      size: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(locale.chest!
                                                      .toUpperCase()),
                                                  Text(type[index]
                                                      .toUpperCase()),
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            locale.arm!.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: darkGrey, letterSpacing: 1),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            locale.workout!.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: darkGrey, letterSpacing: 1),
                          ),
                        ],
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Workouts(locale.chest, type[index])));
                            },
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
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
                                            imgArms[index],
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
                                                  Icon(
                                                    Icons.show_chart,
                                                    color: buttonColor,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons.show_chart,
                                                    color:
                                                        index == 1 || index == 2
                                                            ? buttonColor
                                                            : greyColor,
                                                    size: 15,
                                                  ),
                                                  Icon(
                                                    Icons.show_chart,
                                                    color: index == 2
                                                        ? buttonColor
                                                        : greyColor,
                                                    size: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(locale.arm!.toUpperCase()),
                                                Text(type[index].toUpperCase()),
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
