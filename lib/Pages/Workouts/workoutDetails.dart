import 'dart:ui';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import '../../MySubs/colors.dart';
import 'package:flutter/material.dart';

class WorkoutDetails extends StatefulWidget {
  int currentExcercise;
  WorkoutDetails(this.currentExcercise);
  @override
  _WorkoutDetailsState createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
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
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: AppBar(
                  backgroundColor: Colors.grey[800]!.withOpacity(0.5),
                  leading: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  bottom: PreferredSize(
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.currentExcercise = index;
                                    });
                                  },
                                  child: FadedScaleAnimation(
                                    child: Container(
                                      width: 190,
                                      child: Text('oben'),
                                    ),
                                  //  durationInMilliseconds: 500,
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.currentExcercise > 0
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (widget.currentExcercise > 0) {
                                            widget.currentExcercise--;
                                          }
                                        });
                                      })
                                  : Container(
                                      width: 40,
                                    ),
                              Row(
                                children: [
                                  Text('liste',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                  Text(' unten',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 12, color: darkGrey))
                                ],
                              ),
                              widget.currentExcercise < 5
                                  ? IconButton(
                                      icon: Icon(Icons.chevron_right,
                                          color: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          if (widget.currentExcercise < 5) {
                                            widget.currentExcercise++;
                                          }
                                        });
                                      })
                                  : Container(
                                      width: 40,
                                    )
                            ],
                          )
                        ],
                      ),
                      preferredSize: Size.fromHeight(130)),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(210)),
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
                              Text(' ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 13)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(' ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 13)),
                              Text(' ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 13)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                    },
                    child: FadedScaleAnimation(
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: buttonColor,
                        ),
                        child: Center(
                            child: Text(
                          'button',
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )),
                      ),
                     // durationInMilliseconds: 500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
