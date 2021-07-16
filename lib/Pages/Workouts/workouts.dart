import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import '/Locale/locales.dart';
import '../workoutDetails.dart';
import 'package:trainertimer/Pages/Workouts/workoutSelection.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  final String? type;
  final String? level;
  Workouts(this.type, this.level);
  final List excercise = [
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png"
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List name = [
      locale.jumpingJacks,
      locale.inclinePushUps,
      locale.pushups,
      locale.benchpressPushups,
      locale.wideHandPushUps,
      locale.shortHand
    ];

    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: PreferredSize(
        child: AppBar(
          leading: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.chevron_left),
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              }),
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/imgs/Cropped/Header.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 55,
                  start: 60,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              type!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 20),
                            ),
                            Text(
                              level!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.level!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 12, color: darkGrey),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.show_chart,
                                    color: buttonColor,
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.show_chart,
                                    color: level == locale.intermediate ||
                                            level == locale.advanced
                                        ? buttonColor
                                        : greyColor,
                                    size: 12,
                                  ),
                                  Icon(
                                    Icons.show_chart,
                                    color: level == locale.advanced
                                        ? buttonColor
                                        : greyColor,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 60),
                child: Row(
                  children: [
                    Text(
                      "11 " + locale.workouts!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 12, color: darkGrey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(115),
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/bg1.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutDetails(index)));
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
                              FadedScaleAnimation(
                                Container(
                                  height: 60,
                                  child: Image.asset(excercise[index]),
                                ),
                                durationInMilliseconds: 1000,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name[index].toUpperCase(),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    index != 5
                                        ? Text("x 15",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    fontSize: 12,
                                                    color: darkGrey))
                                        : SizedBox(
                                            height: 20,
                                          )
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
            )
          ],
        ),
        beginOffset: Offset(0.4, 0),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
