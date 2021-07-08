import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:trainertimer/Components/colorButton.dart';
import 'package:trainertimer/Components/textfield.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Pages/Home/home.dart';
import 'package:trainertimer/Theme/colors.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
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
                  height: MediaQuery.of(context).size.height,
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
                        height: 50,
                      ),
                      Text(locale.createNewAccount!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 18,
                              )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            InputField(locale.fullName),
                            SizedBox(
                              height: 1,
                            ),
                            InputField(locale.emailAddress),
                            SizedBox(
                              height: 1,
                            ),
                            InputField(locale.password)
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
                            ColorButton(locale.createAccount),
                            durationInMilliseconds: 1000,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                height: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 20,
                                        child: Image.asset(
                                            "assets/ic_facebok.png")),
                                    Spacer(),
                                    Text(locale.facebook!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 15))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                height: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white, width: 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 20,
                                        child: Image.asset(
                                            "assets/ic_google.png")),
                                    Spacer(),
                                    Text(locale.google!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 15))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(locale.bySigningUp!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      fontSize: 11,
                                    )),
                            SizedBox(
                              height: 2,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(locale.tnc!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontSize: 11, color: buttonColor)),
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
