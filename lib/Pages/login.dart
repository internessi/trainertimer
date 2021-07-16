import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trainertimer/Pages/home.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:trainertimer/MySubs/colorButton.dart';
import 'package:trainertimer/MySubs/textfield.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Theme/colors.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height + 130,
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height + 130,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      height: 260,
                    ),
                    FadedScaleAnimation(
                      Container(
                        height: 150,
                        child: Image.asset("assets/logo.png"),
                      ),
                      durationInMilliseconds: 2000,
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('TrainerTimer',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(' V.0.7.16',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 12, color: darkGrey))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      label: Text(
                        'let\'s get ready',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(Icons.sports_mma),
                      backgroundColor: timerColorPauseBg,
                      foregroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Spacer(),
                    Text(locale.notRegisteredYet!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(locale.createAccount!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
