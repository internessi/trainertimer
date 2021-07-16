import 'dart:async';
import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import '/Locale/locales.dart';
import 'home.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class TakeRest extends StatefulWidget {
  @override
  _TakeRestState createState() => _TakeRestState();
}

class _TakeRestState extends State<TakeRest> {
  late Timer t;
  double? _progressValue;
  int? secs;
  void initState() {
    super.initState();
    _progressValue = 0.0;
    secs = 0;
    _updateProgress();
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(oneSec, (t) {
      setState(() {
        _progressValue = _progressValue! + 0.033;
        secs = secs! + 1;
        if (_progressValue!.toStringAsFixed(1) == '1.0') {
          t.cancel();
          _progressValue = 0.0;
          secs = 30;
          return;
        }
      });
    });
  }

  @override
  void dispose() {
    t.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

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
      //             child: Icon(
      //               Icons.volume_up,
      //               size: 17,
      //             ),
      //           ),
      //         ],
      //       ),
      //     )),
      //     preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height + 100,
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
              Container(
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                            child: Container(
                              color: Colors.grey[800]!.withOpacity(0.5),
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            children: [
                                              Icon(Icons.info_sharp,
                                                  size: 17,
                                                  color: Colors.white),
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
                                    Spacer(),
                                    Text(
                                      locale.goodGoing!.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 25),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(locale.takeRest!),
                                    Spacer(),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        FadedScaleAnimation(
                                          Container(
                                            height: 170,
                                            width: 170,
                                            child: CircularProgressIndicator(
                                              value: _progressValue,
                                              backgroundColor: Colors.grey[800],
                                              strokeWidth: 8,
                                            ),
                                          ),
                                          durationInMilliseconds: 500,
                                        ),
                                        Column(
                                          children: [
                                            FadedScaleAnimation(
                                              Text(
                                                secs.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(fontSize: 55),
                                              ),
                                              durationInMilliseconds: 500,
                                            ),
                                            Text(locale.secs!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(fontSize: 20))
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                        },
                                        child: Text(
                                          locale.skip!,
                                          style: TextStyle(color: buttonColor),
                                        )),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    locale.next!.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: darkGrey, letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    locale.workout!.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            color: darkGrey, letterSpacing: 1),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              FadedSlideAnimation(
                                ClipRect(
                                    child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 4.0, sigmaY: 4.0),
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[800]!.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 60,
                                          child: Image.asset(
                                            "assets/workouts/Layer 749.png",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                locale.benchpressPushups!
                                                    .toUpperCase(),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("x 15",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                          fontSize: 13,
                                                          color: darkGrey))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                                beginOffset: Offset(0.4, 0),
                                endOffset: Offset(0, 0),
                                slideCurve: Curves.linearToEaseOut,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
