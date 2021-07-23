import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Pages/workoutDetails.dart';
import 'package:trainertimer/Pages/Timers/timerSimple.dart';
import 'package:trainertimer/Pages/Timers/TimerSetting.dart';
import 'package:trainertimer/Theme/colors.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class TimerSelection extends StatefulWidget {
  final String? type;
  final String? level;

  TimerSelection(this.type, this.level);

  @override
  _TimerSelectionState createState() => _TimerSelectionState();
}

class _TimerSelectionState extends State<TimerSelection> {

  List sTimer =  [
    ['loading...',  '10',  '10',  '10',  '10',  '1',]
  ];
  int timerDuration = 155, tBoxLength = 0;

  String durationString(String sec) {
    Duration duration = Duration(seconds: int. parse(sec));
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void loadBox() async{
    await Hive.openBox('TimersBox');
    var tBox = Hive.box('TimersBox');
    sTimer.clear();
    if (tBox.length == 0){
      sTimer = [
        ['Tabata',  '10',  '20',  '10',  '8',  '1',],
        ['Fight 3/1',  '20',  '180',  '60',  '12',  '1',],
      ];
      tBox.add(sTimer);
    }
    sTimer = tBox.get(0);
    setState(() {});
  }

  void initState() {
    super.initState();
    print('timerSelection -> initState()');
    loadBox();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List timerTypeColor = [timerColorFight,  timerColorPause, timerColorPrep];

    final  List<IconData> iconTimer =
    [Icons.timer, Icons.alarm, Icons.sports_mma, Icons.change_history, Icons.alarm_on, Icons.alarm_on];

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
                itemCount: sTimer.length,
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
                    child:
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
                                    iconTimer[int. parse(sTimer[index][5])],
                                    color: greyColor,
                                    size: 40,
                                  ),
                                ),
                                durationInMilliseconds: 1500,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        sTimer[index][0].toUpperCase(),
                                        style: Theme.of(context).textTheme .bodyText2! .copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,)
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Row(children: [
                                      Text('V ' + durationString(sTimer[index][1]) + '  ',
                                          style: Theme.of(context).textTheme .bodyText2! .copyWith(color: timerTypeColor[2], fontSize: 14, fontWeight: FontWeight.bold,)
                                      ),
                                      Text('A ' + durationString(sTimer[index][2]) + '  ',
                                          style: Theme.of(context).textTheme .bodyText2! .copyWith(color: timerTypeColor[0], fontSize: 14, fontWeight: FontWeight.bold,)
                                      ),
                                      Text('P ' + durationString(sTimer[index][3]) + '  ',
                                          style: Theme.of(context).textTheme .bodyText2! .copyWith(color: timerTypeColor[1], fontSize: 14, fontWeight: FontWeight.bold,)
                                      ),
                                      Text('R ' + sTimer[index][4] + '  ',
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
                                onPressed: ()  {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimerSetting(index, sTimer)
                                      )
                                  );
                                },
                              ),
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
      floatingActionButton:
      Container(
        height: 45.0,
        width: 45.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.white38  ,
            onPressed: (){
              sTimer.add(['mein Timer',  '10',  '10',  '10',  '3',  '1',]);
              print(sTimer);
              var tBox = Hive.box('TimersBox');
              tBox.put(0, sTimer);
              print(tBox.get(0));
              setState(() {});
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
            ),
         ),
        ),
    );
  }
  @override
  void dispose() {
    Hive.box('TimersBox').close();
    print('timerSelection -> dispose()');
    super.dispose();
  }
}



