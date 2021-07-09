import 'dart:ui';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import '/Pages/Home/startExercise.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SimpleTimerSetup extends StatefulWidget {
  int currentExcercise;
  SimpleTimerSetup(this.currentExcercise);

  @override
  _SimpleTimerSetupState createState() => _SimpleTimerSetupState();
}

class _SimpleTimerSetupState extends State<SimpleTimerSetup> {
  final List excercise = [
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png",
    "assets/workouts/Layer 749.png",
    "assets/workouts/Layer 750.png"
  ];

  int selectedValue = 0;
  bool? checkBoxValue = false;

  showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPicker(
            backgroundColor: Colors.black12,
            onSelectedItemChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            itemExtent: 32.0,
            children: const [
              Text('5 Sek.'),
              Text('10 Sek.'),
              Text('15 Sek.'),
              Text('20 Sek.'),
              Text('30 Sek.'),
              Text('45 Sek.'),
              Text('1 Min.'),
              Text('1 1/2 Min.'),
              Text('2 Min.'),
              Text('2 1/2 Min.'),
              Text('3 Min.'),
              Text('3 1/2 Min.'),
              Text('4 Min.'),
              Text('5 Min.'),
            ],
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
        extendBodyBehindAppBar: true,
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
                                'EINFACHER',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 20),
                              ),
                              Text(
                                'INTERVALLTIMER',
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
                              Text(locale.lorem!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 13)),

                              CheckboxListTile(
                                title: Text("Your message",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontSize: 13)),
                                activeColor: Colors.grey,
                                value: checkBoxValue,
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkBoxValue = value;
                                  });
                                },
                              ),
                              Column(
                                children: <Widget>[
                                  const SizedBox(height: 10.0),
                                  Text("Selected: $selectedValue"),
                                  const SizedBox(height: 10.0),
                                  Center(
                                    child: RaisedButton(
                                      onPressed: showPicker,
                                      child: Text("Show picker"),
                                    ),
                                  ),
                                ],
                              ),
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
        ));
  }

}
