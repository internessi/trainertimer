import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Pages/Trainers/trainerFight.dart';
import 'package:trainertimer/MySubs/ttCards.dart';
import 'package:trainertimer/MySubs/colors.dart';
import 'package:trainertimer/Pages/Workouts/workoutBasic.dart';

class WorkoutSelection extends StatelessWidget {
  final String? type;
  final String? level;
  WorkoutSelection(this.type, this.level);
  final List excercise = [
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png"
  ];

  List imgTrainer = [
    "assets/imgs/Cropped/crop31.png",
    "assets/imgs/Cropped/crop31.png",
    "assets/imgs/Cropped/crop31.png"
  ];
  List textTrainer = ['Boxen', 'Boxing', 'BOXING 3/1'];
  List typeTrainer = ['Frank Wolf', 'Frank Wolf', 'Frank Wolf'];
  List lineTrainer = [
    'Boxtraining (Deutsch)',
    'Boxing (English)',
    'Boxtraining 3 Minuten Runden'
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List name = [
      locale.timer1,
      locale.timer2,
      locale.timer3,
      locale.timer4,
      locale.timer5,
      locale.timer6,
    ];

    final List<IconData> iconTimer = [
      Icons.timer,
      Icons.alarm,
      Icons.sports_mma,
      Icons.change_history,
      Icons.alarm_on,
      Icons.alarm_on
    ];

    List footerTimer = [
      'einfacher Intervalltimer',
      'Workout/Erholung, Wiederholungen/Sets',
      'Kampf/Ecke, Runden',
      'Pyramidentimer auf-/absteigend',
      'einstellbarer Timer',
      'einstellbarer Timer'
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
                          "assets/imgs/Cropped/Header3.png",
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
                              'TIMER',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 20),
                            ),
                            Text(
                              'TRAINING',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutBasic('Boxen 2/1',10,120,60,1)
                          )
                      );
                    },
                    child: TraierTimerCard(textTrainer[0], typeTrainer[0],
                        lineTrainer[0], imgTrainer[0], 0, 0, 1, 0, 0, 0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkoutBasic('Boxen 2/1',35,120,60,1)
                          )
                      );
                    },
                    child: TraierTimerCard(textTrainer[1], typeTrainer[1],
                        lineTrainer[1], imgTrainer[0], 0, 0, 0, 1, 0, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0.4, 0),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
