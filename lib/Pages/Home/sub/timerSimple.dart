import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import '/Pages/Home/startExercise.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '/Theme/colors.dart';
import 'dart:ui';
import 'dart:math' as math;

class TimerSimple extends StatefulWidget {
  int currentExcercise;
  TimerSimple(this.currentExcercise);

  @override
  _TimerSimpleState createState() => _TimerSimpleState();
}

class _TimerSimpleState extends State<TimerSimple> {


  int selectedValue = 0;
  bool? checkBoxValue = false;


  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:
        PreferredSize(
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
                  title: Text(
                    locale.workout!,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: greyColor, fontWeight: FontWeight.normal),
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.arrow_forward, color: greyColor, size: 18),
                                ),
                                TextSpan(
                                  text: ' Trainer anzeigen',
                                ),
                              ],
                            ),
                          )

                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.fitness_center,
                          color: greyColor,
                          size: 18,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(AppBar().preferredSize.height)),


        body: Stack(
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
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[800]!.withOpacity(0.5),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ListView(
                            children: [


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StartWorkout(widget.currentExcercise)));
                    },
                    child: FadedScaleAnimation(
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: buttonColor,
                        ),
                        child: Center(
                            child: Text(
                              locale.letsStart!,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            )),
                      ),
                      durationInMilliseconds: 500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
