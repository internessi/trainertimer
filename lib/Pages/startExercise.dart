import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import 'rest.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class StartWorkout extends StatelessWidget {
  final List excercise = [
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png"
  ];
  final int index;
  StartWorkout(this.index);

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
      extendBodyBehindAppBar: true,
      // appBar: PreferredSize(
      //     child: ClipRRect(
      //         child: BackdropFilter(
      //       filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      //       child: AppBar(
      //         elevation: 0,
      //         backgroundColor: Colors.grey[800].withOpacity(0.5),
      //         leading: IconButton(
      //           icon: Icon(Icons.chevron_left),
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //         ),
      //         actions: [
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 15),
      //             child: Row(
      //               children: [
      //                 Icon(
      //                   Icons.info_sharp,
      //                   size: 17,
      //                 ),
      //                 SizedBox(
      //                   width: 10,
      //                 ),
      //                 Icon(
      //                   Icons.volume_up,
      //                   size: 17,
      //                 )
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     )),
      //     preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
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
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey[800]!.withOpacity(0.5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Icon(Icons.info_sharp,
                                      size: 17, color: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.volume_up,
                                      size: 17, color: Colors.white)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 5,
                          child: FadedScaleAnimation(
                            Container(
                              // height: 250,
                              child: Image.asset(excercise[index]),
                            ),
                            durationInMilliseconds: 500,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("x 16",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: buttonColor, fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          name[index].toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 25),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => index < 5
                                        ? StartWorkout(index + 1)
                                        : TakeRest()));
                          },
                          child: FadedScaleAnimation(
                            Container(
                              height: 50,
                              width: 170,
                              decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  locale.done!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 17),
                                ),
                              ),
                            ),
                            durationInMilliseconds: 500,
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (index > 0)
                                IconButton(
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StartWorkout(index - 1)));
                                    }),
                              if (index > 0)
                                Expanded(
                                  child: Text(name[index - 1],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(fontSize: 11)),
                                ),
                              if (index < 5)
                                Expanded(
                                  child: Text(
                                    name[index + 1],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 11),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              if (index < 5)
                                IconButton(
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  StartWorkout(index + 1)));
                                    })
                            ],
                          ),
                        )
                      ],
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
