import '/Locale/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '/Theme/colors.dart';
import 'dart:ui';
import 'dart:math' as math;

class TimerSimple extends StatefulWidget {
  Duration? duration;
  @override
  _TimerSimpleState createState() => _TimerSimpleState();
}

class _TimerSimpleState extends State<TimerSimple>
    with TickerProviderStateMixin {
  late AnimationController controller;
  int lastDuration = 0, timerDuration = 3, timerType = 2, timerRounds = 0, timerRound = 0 ;
  Color timerColor = timerColorPrep, timerColorBg = timerColorPrepBg;

  List timerTypeColor = [timerColorFight,  timerColorPause, timerColorPrep];
  List timerTypeColorBg = [timerColorFightBg, timerColorPauseBg,  timerColorPrepBg];
  List timerTypeColorR = [timerColorFightR, timerColorPauseR,  timerColorPrepR];
  List timerTypeText = ['Aktivzeit', 'Erholungszeit',  'Vorbereitung'];

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: timerDuration),
    )
      ..addListener(() {
        setState(() {
          Duration duration = controller.duration! * controller.value;
          if (lastDuration != duration.inSeconds){
            lastDuration = duration.inSeconds;
            print(duration.inSeconds);
          }
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (controller.isDismissed) {
          timerType = timerType + 1;
          if (timerType > 1)
            timerType = 0;
          controller.duration = Duration(seconds: 5);
          timerColor = timerTypeColor[timerType];
          timerColorBg = timerTypeColorBg[timerType];
          controller.reverse(
              from: controller.value == 0.0
                  ? 1.0
                  : controller.value);
        }
        print(status);
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
                      Navigator.pop(context);
                    }),
                titleSpacing: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.3),
                title: Text(
                  locale.workout!,
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          child: Text(
                              "0:05".toUpperCase(),
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(timerTypeColorBg[2]),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]!.withOpacity(0.5)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: Colors.grey[800]!.withOpacity(0.5), width: 3)
                                  )
                              )
                          ),
                          onPressed: () => null
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          child: Text(
                              "0:10".toUpperCase(),
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(timerTypeColorBg[0]),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]!.withOpacity(0.5)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: Colors.grey[800]!.withOpacity(0.5), width: 3)
                                  )
                              )
                          ),
                          onPressed: () => null
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          child: Text(
                              "0:10".toUpperCase(),
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(timerTypeColorBg[1]),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[800]!.withOpacity(0.5)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: Colors.grey[800]!.withOpacity(0.5), width: 3)
                                  )
                              )
                          ),
                          onPressed: () => null
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      backgroundColor: Colors.white10,
      body:
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
          SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                      child: Container(
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
                                  Container(
                                    height:
                                    controller.value * (MediaQuery.of(context).size.height - 200),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: timerColorBg,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),//groessere zahl, kleinerer Kreis
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        child: Align(
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
                                      ),
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
                                            onPressed: () {},
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
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25,
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
                                                        controller.reverse(
                                                            from: controller.value == 0.0
                                                                ? 1.0
                                                                : controller.value);
                                                      }
                                                    },
                                                    icon: Icon(controller.isAnimating
                                                        ? Icons.pause
                                                        : Icons.play_arrow),
                                                    label: Text(
                                                        controller.isAnimating ? "Pause" : "Start")
                                                );
                                              }),
                                          SizedBox(
                                            width: 10,
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
                                                      if (controller.isAnimating){
                                                        controller.stop();
                                                        timerType = 2;
                                                        timerColor = timerTypeColor[2];
                                                        timerColorBg = timerTypeColorBg[2];
                                                        controller.reset();
                                                        controller.stop();

                                                      }
                                                      else {
                                                        controller.reverse(
                                                            from: controller.value == 0.0
                                                                ? 1.0
                                                                : controller.value);
                                                      }
                                                    },
                                                    icon: Icon(controller.isAnimating
                                                        ? Icons.replay_sharp
                                                        : Icons.settings),
                                                    label: Text(
                                                        controller.isAnimating ? "Reset" : "Einstellung")
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