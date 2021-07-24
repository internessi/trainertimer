import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hive/hive.dart';
import 'package:trainertimer/Pages/Timers/timerDialog.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/MySubs/colors.dart';
import 'process120.dart';
import 'mp3Rutten.dart';

class WorkoutBasic extends StatefulWidget {

  final String timerLabel;
  final int preDuration, actDuration, pauDuration, timerRounds;
  WorkoutBasic (this.timerLabel,this.preDuration,this.actDuration,this.pauDuration,this.timerRounds);

  Duration? duration;
  @override
  _WorkoutBasicState createState() => _WorkoutBasicState();
}

class _WorkoutBasicState extends State<WorkoutBasic>
    with TickerProviderStateMixin {
  late AnimationController controller;
  AudioCache audioCache= AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  final List _mp3Rutten  = Mp3Rutten().mp3Rutten;
  final List<int> _pre20 = TrainingProcess().pre20;
  final List<int> _act120 = TrainingProcess().act120;

  int lastDuration = 0, timerType = 2, timerRounds = 0, timerRound = 0 ;
  int preDuration = 5, actDuration = 10, pauDuration = 10;
  bool resetPressed = false, timerRunning = false, lastRound = false;

  Color timerColor = timerColorPrep, timerColorBg = timerColorPrepBg;

  List timerTypeColor = [timerColorFight,  timerColorPause, timerColorPrep];
  List timerTypeColorBg = [timerColorFightBg, timerColorPauseBg,  timerColorPrepBg];
  List timerTypeColorR = [timerColorFightR, timerColorPauseR,  timerColorPrepR];
  List timerTypeText = ['Aktivzeit', 'Erholungszeit',  'Vorbereitung'];
  List timerDuration = [10, 10, 5];

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }
  String durationString(String sec) {
    Duration duration = Duration(seconds: int.parse(sec));
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override

  void initState() {
    super.initState();
    preDuration = widget.preDuration;
    actDuration = widget.actDuration;
    pauDuration = widget.pauDuration;
    timerRounds = widget.timerRounds;
    timerDuration = [actDuration, pauDuration, preDuration];
    initSounds();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: preDuration),
    )
      ..addListener(() {
        setState(() {
          Duration duration = controller.duration! * controller.value;
          if (lastDuration != duration.inSeconds){
            if (duration.inSeconds == 0){
              if (timerType == 0){
                playSound('mp3/bell.mp3');
              } else {
                playSound('mp3/bell.mp3');
              }
            }
            lastDuration = duration.inSeconds;
            int tableTime = 120 - lastDuration;

            if (timerType == 2) {
              if (_pre20[lastDuration] > 0) {
                print(_mp3Rutten[_pre20[lastDuration]][4]);
                playSound(_mp3Rutten[_pre20[lastDuration]][4]);


              }
            }
            if (timerType == 0) {
              if (_act120[tableTime] > 0) {
                print(_mp3Rutten[_act120[tableTime]][4]);
                playSound(_mp3Rutten[_act120[tableTime]][4]);
              }
            }



            // print(duration.inSeconds);
          }
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (controller.isDismissed && timerRunning && !lastRound) {
          timerType = timerType + 1;
          if (timerType > 1)
            timerType = 0;
          if (timerType == 0)
            timerRound = timerRound + 1;
          if (timerRounds == timerRound)
            lastRound = true;
          controller.duration = Duration(seconds: timerDuration[timerType]);
          timerColor = timerTypeColor[timerType];
          timerColorBg = timerTypeColorBg[timerType];
          controller.reverse(
              from: controller.value == 0.0
                  ? 1.0
                  : controller.value);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    ThemeData themeData = Theme.of(context);
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
                        if (controller.isAnimating)
                          controller.stop();
                        Navigator.pop(context);
                      }),
                  titleSpacing: 0,
                  backgroundColor: Colors.grey[800]!.withOpacity(0.3), // Bereich Appbar
                  title: Row(children: [
                    Text(
                        widget.timerLabel + '  ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color:
                        Colors.white, fontSize: 16, fontWeight: FontWeight.bold,
                        )),
                    Text(
                        'V ' + durationString(preDuration.toString()) + '  ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color:
                        timerTypeColor[2], fontSize: 16, fontWeight: FontWeight.bold,
                        )),
                    Text(
                        'A ' + durationString(actDuration.toString()) + '  ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color:
                        timerTypeColor[0], fontSize: 16, fontWeight: FontWeight.bold,
                        )),
                    Text(
                        'P ' + durationString(pauDuration.toString()) + '  ',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(color:
                        timerTypeColor[1], fontSize: 16, fontWeight: FontWeight.bold,
                        )),
                  ],),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(Icons.settings),
                          color: Colors.white12,
                          iconSize: 30,
                          splashRadius: 30,
                          disabledColor: Colors.blueAccent,
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute<Null>(
                                builder: (BuildContext context) {
                                  return new TimerDialog();
                                },
                                fullscreenDialog: true
                            ));
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
        backgroundColor: Colors.white10, // keine Auswirkung
        body:
        Stack(
          children: [
            Container( // gesamter Bildschirm
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
                  Container( // gesamter Innenbereich (Bildschirm - AppBar)
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Container(  // innenbereich Insel
                          margin: EdgeInsets.only(bottom: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[800]!.withOpacity(0.5),
                          ),
                          // padding: EdgeInsets.symmetric(
                          //    horizontal: 20, vertical: 20),
                          child: AnimatedBuilder(
                              animation: controller,
                              builder: (context, child) {
                                return Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child:
                                      Container(    // Zeiteffekt innenbereich Insel
                                        height:
                                        controller.value * (MediaQuery.of(context).size.height - 100),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: timerColorBg,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15), //groessere zahl, kleinerer Kreis
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Align(
                                            alignment: FractionalOffset.topCenter,
                                            child: AspectRatio(
                                              aspectRatio: 1.0,
                                              child: Padding(
                                                padding: EdgeInsets.all(15),//groessere zahl, kleinerer Kreis
                                                child: Stack(
                                                  children: <Widget>[
                                                    Positioned.fill(
                                                      child: CustomPaint(
                                                          painter: CustomTimerPainter(
                                                            animation: controller,
                                                            backgroundColor: timerColor,
                                                            color: themeData.indicatorColor,
                                                          )),
                                                    ),
                                                    Align(
                                                      alignment: FractionalOffset.center,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: <Widget>[
                                                          Text(
                                                            timerTypeText[timerType],
                                                            style: TextStyle(
                                                                fontSize: 28.0,
                                                                color: Colors.white),
                                                          ),
                                                          Text(
                                                            timerString,
                                                            style: TextStyle(
                                                                fontSize: 102.0,
                                                                color: Colors.white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),


                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [


                                              Text(
                                                  'Runden',
                                                  style: TextStyle(fontSize: 38.0)
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(Icons.remove_circle_outline),
                                                    color: Colors.white,
                                                    iconSize: 50,
                                                    splashRadius: 40,
                                                    disabledColor: Colors.blueAccent,
                                                    onPressed: () {
                                                      if (timerRounds > 0)
                                                        timerRounds = timerRounds - 1;
                                                      setState(() {});
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                      child: Text(
                                                          timerRound.toString(),
                                                          style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold)
                                                      ),
                                                      style: ButtonStyle(
                                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]!.withOpacity(0.5)),
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                  side: BorderSide(color: timerTypeColorR[timerType], width: 5)
                                                              )
                                                          )
                                                      ),
                                                      onPressed: () => null
                                                  ),
                                                  Text(
                                                      " / ".toUpperCase(),
                                                      style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold)
                                                  ),
                                                  ElevatedButton(
                                                      child: Text(
                                                          timerRounds.toString(),
                                                          style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.bold)
                                                      ),
                                                      style: ButtonStyle(
                                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]!.withOpacity(0.5)),
                                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(18.0),
                                                                  side: BorderSide(color: timerTypeColorR[timerType], width: 5)
                                                              )
                                                          )
                                                      ),
                                                      onPressed: () => null
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.add_circle_outline),
                                                    color: Colors.white,
                                                    iconSize: 50,
                                                    splashRadius: 40,
                                                    disabledColor: Colors.blueAccent,
                                                    onPressed: () {
                                                      timerRounds = timerRounds + 1;

                                                      setState(() {});
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),



                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              AnimatedBuilder(
                                                  animation: controller,
                                                  builder: (context, child) {
                                                    return FloatingActionButton.extended(
                                                        heroTag: 'Pause/Start',
                                                        backgroundColor: timerTypeColor[timerType],
                                                        foregroundColor: Colors.black87,
                                                        splashColor: Colors.white,
                                                        onPressed: () {
                                                          if (controller.isAnimating)
                                                            controller.stop();
                                                          else {
                                                            timerRunning = true;
                                                            controller.reverse(
                                                                from: controller.value == 0.0
                                                                    ? 1.0
                                                                    : controller.value);
                                                          }
                                                          setState(() {

                                                          });
                                                        },
                                                        icon: Icon(controller.isAnimating
                                                            ? Icons.pause
                                                            : Icons.play_arrow),
                                                        label: Text(
                                                            controller.isAnimating ? "Pause" : "Start")
                                                    );
                                                  }),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              AnimatedBuilder(
                                                  animation: controller,
                                                  builder: (context, child) {
                                                    return FloatingActionButton.extended(
                                                        heroTag: 'Reset/Settings',
                                                        backgroundColor: timerTypeColor[timerType],
                                                        foregroundColor: Colors.black87,
                                                        splashColor: Colors.white,
                                                        onPressed: () {
                                                          if (timerRunning){
                                                            timerRunning = false;
                                                            controller.stop();
                                                            print('nach stop');
                                                            controller.reset();
                                                            print('nach reset');
                                                            timerType = 2;
                                                            timerColor = timerTypeColor[2];
                                                            timerColorBg = timerTypeColorBg[2];
                                                            lastRound = false;
                                                            timerRound = 0;
                                                            print('nach set');

                                                            controller.stop();
                                                            print('nach stop');

                                                            setState(() {

                                                            });

                                                          }
                                                          else {
                                                            controller.reverse(
                                                                from: controller.value == 0.0
                                                                    ? 1.0
                                                                    : controller.value);
                                                          }
                                                        },
                                                        icon: Icon(timerRunning
                                                            ? Icons.replay_sharp
                                                            : Icons.settings),
                                                        label: Text(
                                                            timerRunning ? "Reset" : "Einstellung")
                                                    );
                                                  }),
                                            ],),

                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        )
    );
  }

  void initSounds() async {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    // audioCache.loadAll(mp3);
  }

  void playSound(_mp3) async {
    var fileName = _mp3;
    if ( audioPlayer.state.index == 1) {
      audioPlayer.stop();
    }
    audioPlayer = await audioCache.play(fileName);
  }

  void stopSound(_mp3) {
    audioPlayer.stop();
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 12.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    paint.color = Colors.black54;

    double progress = (1.0 - animation.value) * 2 * math.pi;

    if(animation.value == 0){
      progress = (0) * 2 * math.pi;
    }

    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }

}