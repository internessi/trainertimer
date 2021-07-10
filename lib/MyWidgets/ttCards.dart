import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import '/Theme/colors.dart';
import '/Locale/locales.dart';

class TimerCard extends StatelessWidget {
  final String? title;
  TimerCard(this.title);



  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    int index = 0;
    List imgTimer = [
      "assets/imgs/Cropped/crop22.png",
    ];
    List typeTimer = ['Timer'];
    List lineTimer = ['Intervall, Runden, HITT, Tabatta, ...'];

    return

      Container(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            margin: EdgeInsets.only(top: 10),
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
                      imgTimer[index],
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
                            Container(
                              height: 18,
                              child:
                              Icon(
                                Icons.timer,
                                color: index == 1 ||
                                    index == 2
                                    ? buttonColor
                                    : greyColor,
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: 18,
                              child:
                              Icon(
                                Icons.access_time_rounded,
                                color: index == 1 ||
                                    index == 2
                                    ? buttonColor
                                    : greyColor,
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: 18,
                              child:
                              Icon(
                                Icons.timelapse_sharp,
                                color: index == 1 ||
                                    index == 2
                                    ? buttonColor
                                    : greyColor,
                                size: 15,
                              ),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text('TIMER'
                              .toUpperCase()),
                          Text('TRAINING'
                              .toUpperCase()),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            lineTimer[index],
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
  }
}

class TraierTimerCard extends StatelessWidget {
  final String? title;
  TraierTimerCard(this.title);

  @override
  Widget build(BuildContext context) {

    var locale = AppLocalizations.of(context)!;
    int index = 0;
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

    return

      Container(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              margin: EdgeInsets.only(top: 10),
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
                        imgFight[index],
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
                            Text(textFight[index]!
                                .toUpperCase()),
                            Text(typeFight[index]
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
  }
}