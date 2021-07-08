import 'dart:ui';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:trainertimer/Components/colorButton.dart';
import 'package:trainertimer/Components/textfield.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Pages/Auth/Login/login.dart';
import 'package:trainertimer/Pages/Home/home.dart';
import 'package:trainertimer/Theme/colors.dart';
import 'package:flutter/material.dart';

class Verification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height + 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 95,
                      ),
                      FadedScaleAnimation(
                        Container(
                          height: 110,
                          child: Image.asset("assets/logo.png"),
                        ),
                        durationInMilliseconds: 1000,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(locale.forgotPassword!,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                  )),
                      SizedBox(
                        height: 40,
                      ),
                      Text(locale.provideYourEmail!,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 13,
                                  )),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            InputField(locale.enterEmailAddress),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: FadedScaleAnimation(
                            ColorButton(locale.submit),
                            durationInMilliseconds: 1000,
                          )),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(locale.backto!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 11)),
                            SizedBox(
                              width: 3,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                locale.login!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: buttonColor, fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
