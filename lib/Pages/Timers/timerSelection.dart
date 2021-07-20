import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Pages/workoutDetails.dart';
import 'package:trainertimer/Pages/Timers/timerSimple.dart';
import 'package:trainertimer/Theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainertimer/MySubs/preferences.dart';


class TimerSelection extends StatelessWidget {
  final String? type;
  final String? level;
  final sTimer = StoreTimerPreferences.getTimer();
  TimerSelection(this.type, this.level);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List name = [
      sTimer.lab1,
      sTimer.lab2,
      locale.timer3,
      locale.timer4,
      locale.timer5,
      locale.timer6,
    ];

    List Timer = [
      [sTimer.lab1,  sTimer.pre1,  sTimer.act1,  sTimer.reg1,  sTimer.rnd1,  sTimer.ico1,],
      [sTimer.lab2,  sTimer.pre2,  sTimer.act2,  sTimer.reg2,  sTimer.rnd2,  sTimer.ico2,],
      ['Intervalltimer',  '0:10',  '0:30',  '0:10',  '10',  '3',],
      ['Pyramide',  '0:10',  '0:30',  '0:10',  '10',  '3',],
      ['Mein Timer 1',  '0:10',  '0:30',  '0:10',  '10',  '3',],
      ['Mein Timer 2',  '0:10',  '0:30',  '0:10',  '10',  '3',]
    ];


    final  List<IconData> iconTimer =
    [Icons.timer,
      Icons.alarm,
      Icons.sports_mma,
      Icons.change_history,
      Icons.alarm_on,
      Icons.alarm_on];

    List  footerTimer= ['einfacher Intervalltimer', 'Workout/Erholung, Wiederholungen/Sets', 'Kampf/Ecke, Runden', 'Pyramidentimer auf-/absteigend', 'einstellbarer Timer', 'einstellbarer Timer'];

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
                          "assets/imgs/Cropped/Header1.png",
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
                              'Timer',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 20),
                            ),
                            Text(
                              'Trainer',
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
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder:  index == 0
                                  ? (context) => TimerSimple()
                                  : (context) => WorkoutDetails(index)
                          ));
                    },
                    child: TimerCard(Timer[index][0], Timer[index][1], Timer[index][2], Timer[index][3], Timer[index][4], Timer[index][5])
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



//TimerCard( lab,  pre,  act,  reg,  rnd,  ico;),


class TimerCard extends StatelessWidget {
  final String lab,  pre,  act,  reg,  rnd,  ico;

  TimerCard(this.lab, this.pre, this.act, this.reg, this.rnd, this.ico);

  final  List<IconData> iconTimer = [Icons.timer, Icons.alarm, Icons.sports_mma, Icons.change_history, Icons.alarm_on, Icons.alarm_on];
  final  List timerTypeColor = [timerColorFight,  timerColorPause, timerColorPrep];
  final  List timerTypeColorBg = [timerColorFightBg, timerColorPauseBg,  timerColorPrepBg];
  final  List timerTypeColorR = [timerColorFightR, timerColorPauseR,  timerColorPrepR];

  @override
  Widget build(BuildContext context) {

    var locale = AppLocalizations.of(context)!;
    return
      ClipRRect(
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
                    child:
                    Icon(
                      iconTimer[int. parse(ico)],
                      color: greyColor,
                      size: 40,
                    ),
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
                         lab.toUpperCase(),
                          style: Theme.of(context).textTheme .bodyText2! .copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,)
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(children: [
                        Text('V ' + pre + '  ',
                            style: Theme.of(context).textTheme .bodyText2! .copyWith(color: timerTypeColor[2], fontSize: 14, fontWeight: FontWeight.bold,)
                        ),
                        Text('A ' + act + '  ',
                            style: Theme.of(context).textTheme .bodyText2! .copyWith(color: timerTypeColor[0], fontSize: 14, fontWeight: FontWeight.bold,)
                        ),
                        Text('P ' + reg + '  ',
                            style: Theme.of(context).textTheme .bodyText2! .copyWith(color: timerTypeColor[1], fontSize: 14, fontWeight: FontWeight.bold,)
                        ),
                        Text('R ' + rnd + '  ',
                            style: Theme.of(context).textTheme .bodyText2! .copyWith(color: greyColor, fontSize: 14, fontWeight: FontWeight.bold,)
                        ),
                      ],),
                    ],
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.white12,
                  iconSize: 25,
                  splashRadius: 25,
                  disabledColor: Colors.blueAccent,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text('ALERT',
                              style: Theme.of(context).textTheme .bodyText2! .copyWith(color: greyColor, fontSize: 14, fontWeight: FontWeight.bold,)
                          ),
                        );
                      },
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      );
  }
}