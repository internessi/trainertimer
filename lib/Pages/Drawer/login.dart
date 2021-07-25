import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trainertimer/Pages/home.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:trainertimer/MySubs/colorButton.dart';
import 'package:trainertimer/MySubs/textfield.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/MySubs/colors.dart';



class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final timer = [
    ['Intervalltimer',  '10',  '30',  '10',  '10',  '3',],
    ['Pyramide',  '10',  '30',  '10',  '10',  '1',],
    ['Mein Timer 1',  '10',  '30',  '10',  '10',  '2',],
    ['Mein Timer 2',  '10',  '30',  '10',  '10',  '3',]
  ];

  String name = '';
  String _keyUsername = 'username';



  Future<void> _incrementCounter() async {



    setState(() {
    });
  }


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
                      height: 126,
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
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('sdf'),
                        SizedBox(width: 2),

                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:

                      TextFormField(
                        initialValue: name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,

                          border: OutlineInputBorder(),
                          hintText:  'name',
                        ),
                        onChanged: (name) => setState(() => this.name = name),
                      )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                     FloatingActionButton(
                      onPressed: () async {

                      },
                      child: const Icon(Icons.navigation),
                      backgroundColor: Colors.green,
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