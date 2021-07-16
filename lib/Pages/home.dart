import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Pages/workouts.dart';
import 'package:trainertimer/MyWidgets/ttCards.dart';
import 'package:trainertimer/Pages/Timers/timerSelection.dart';
import 'package:trainertimer/Theme/colors.dart';
import 'package:trainertimer/Pages/Drawer/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    // TIMER TRAINING
      List imgTimer = [
        "assets/imgs/Cropped/crop22.png"
      ];
      List textTimer = ['Timer'];
      List typeTimer = ['Training'];
      List lineTimer = ['Intervall, Runden, HITT, Tabatta, ...'];
    // FIGHT TRAINING
      List imgFight = [
        "assets/imgs/Cropped/crop11.png",
        "assets/imgs/Cropped/crop12.png",
        "assets/imgs/Cropped/crop13.png"
      ];
      List textFight = ['Warmup', 'BOXING', 'Muay Thai'];
      List typeFight = ['TRAINING', 'TRAINING', 'TRAINING'];
      List lineFight = ['3 Trainer, 3 Workouts', '2 Trainer, 4 Workouts', '1 Trainer, 2 Workouts'];
    // FITNESS TRAINING
      List imgFitness = [
        "assets/imgs/Cropped/crop21.png",
        "assets/imgs/Cropped/crop23.png"
      ];
      List textFitness = ['Fitness', 'Fitness'];
      List typeFitness = [locale.beginner, locale.intermediate];
      List lineFitness = ['2 Trainer, 2 Workouts', '2 Trainer, 4 Workouts'];




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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimerSelection(
                                  locale.chest, typeTimer[0])));
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

                      // TIMER TRAINING
                  Text(
                      locale.headline1!.toUpperCase(),
                      style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.white60, letterSpacing: 1),
                  ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerSelection(
                                      locale.chest, typeTimer[0])));
                        },
                        child:
                        TraierTimerCard(textTimer[0],typeTimer[0], lineTimer[0], imgTimer[0], 0, 1, 1, 0, 0),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // FIGHT TRAINING
                      Text(
                        locale.headline2!.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white60, letterSpacing: 1),
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
                              TraierTimerCard(textFight[index],typeFight[index], lineFight[index],
                                              imgFight[index], index, 0, 1, 0, 0),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      // FITNESS TRAINING
                      Text(
                        locale.headline3!.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white60, letterSpacing: 1),
                      ),
                      Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Workouts(
                                            locale.arm, typeFitness[index])));
                              },
                              child:
                              TraierTimerCard(textFitness[index],typeFitness[index],
                                              lineFitness[index], imgFitness[index], index, 0, 1, 1, 0),
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
