import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import '/Locale/locales.dart';
import '/Pages/Auth/Login/login.dart';
import '/Pages/Home/Drawer/changeLanguage.dart';
import '/Pages/Home/Drawer/privacyPolicy.dart';
import '/Pages/Home/Drawer/profile.dart';
import '/Pages/Home/Drawer/rateUs.dart';
import '/Pages/Home/Drawer/setAlarm.dart';
import '/Pages/Home/Drawer/shareApp.dart';
import '/Pages/Home/home.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

import 'blogs.dart';

class MyDrawer extends StatelessWidget {
  final List icons = [
    Icons.home,
    Icons.alarm_on,
    Icons.file_copy,
    Icons.info,
    Icons.language,
    Icons.share,
    Icons.thumb_up
  ];

  final List routes = [
    HomePage(),
    SetAlarm(),
    Blogs(),
    PrivacyPolicy(),
    Language(),
    ShareApp(),
    RateUs()
  ];
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List drawerItems = [
      locale.home,
      locale.setAlarm,
      locale.blogs,
      locale.privacyPolicy,
      locale.selectLanguage,
      locale.shareApp,
      locale.rateUs
    ];

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
        child: Opacity(
          opacity: 0.7,
          child: Drawer(
            child: Container(
              color: Colors.grey[900],
              child: FadedSlideAnimation(
                ListView(
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      leading: Container(
                        height: 90,
                        child: Image.asset("assets/img5.png"),
                      ),
                      title: Text("Sam Smith",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 17)),
                      subtitle: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        child: Text(locale.viewProfile!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13, color: darkGrey)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => routes[index]));
                          },
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                          leading: Icon(
                            icons[index],
                            color: buttonColor,
                            size: 20,
                          ),
                          horizontalTitleGap: 0,
                          title: Text(drawerItems[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 15)),
                        );
                      },
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                      leading: Icon(
                        Icons.logout,
                        color: buttonColor,
                        size: 20,
                      ),
                      horizontalTitleGap: 0,
                      title: Text(locale.logout!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 15)),
                    ),
                  ],
                ),
                beginOffset: Offset(-0.4, 0),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
