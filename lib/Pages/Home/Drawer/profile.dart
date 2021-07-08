import 'dart:ui';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Components/colorButton.dart';
import '/Locale/locales.dart';
import '/Pages/Home/Drawer/drawer.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: AppBar(
                elevation: 0,
                title: Text(
                  locale.profile!,
                  style: TextStyle(fontSize: 18),
                ),
                leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      scaffoldKey.currentState!.openDrawer();
                    }),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
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
              SafeArea(
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    FadedScaleAnimation(
                                      Container(
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image(
                                            image: AssetImage(
                                              "assets/img5.png",
                                            ),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      durationInMilliseconds: 1000,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 27,
                                        width: 27,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: buttonColor),
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 15,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      ClipRect(
                                          child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[800]!
                                                .withOpacity(0.5),
                                          ),
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                locale.userName!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        color: Colors.grey[200],
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Flexible(
                                                  child: InputText(
                                                      false, "Emily Williams"))
                                            ],
                                          ),
                                        ),
                                      )),
                                      ClipRect(
                                          child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4.0),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[800]!
                                                .withOpacity(0.5),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                locale.gender!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        color: Colors.grey[200],
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Flexible(
                                                  child: InputText(
                                                      true, locale.male))
                                            ],
                                          ),
                                        ),
                                      )),
                                      ClipRect(
                                          child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4.0),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[800]!
                                                .withOpacity(0.5),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                locale.emailAddress!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        color: Colors.grey[200],
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Flexible(
                                                  child: InputText(false,
                                                      "samsmith@mail.com"))
                                            ],
                                          ),
                                        ),
                                      )),
                                      ClipRect(
                                          child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4.0),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[800]!
                                                .withOpacity(0.5),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                locale.birthdate!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        color: Colors.grey[200],
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Flexible(
                                                  child: InputText(
                                                      false, "25-07-1989"))
                                            ],
                                          ),
                                        ),
                                      )),
                                      ClipRect(
                                          child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4.0),
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey[800]!
                                                .withOpacity(0.5),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                locale.country!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        color: Colors.grey[200],
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Flexible(
                                                  child: InputText(true, "USA"))
                                            ],
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: FadedScaleAnimation(
                                      ColorButton(locale.updateProfile),
                                      durationInMilliseconds: 1000,
                                    ))
                              ],
                            ),
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final bool suffix;
  final String? text;
  InputText(this.suffix, this.text);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.end,
      initialValue: text,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: Colors.grey[200], fontSize: 13, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        suffix: suffix
            ? Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: 15,
              )
            : null,
        border: InputBorder.none,
      ),
    );
  }
}
