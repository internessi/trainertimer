import 'dart:ui';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:trainertimer/Locale/locales.dart';
import 'package:trainertimer/Pages/Drawer/changeLanguage.dart';
import 'package:trainertimer/Pages/Drawer/privacyPolicy.dart';
import 'package:trainertimer/Pages/home.dart';
import 'package:trainertimer/MySubs/colors.dart';
import 'package:flutter/material.dart';

import 'blogs.dart';

class MyDrawer extends StatelessWidget {
  final List icons = [
    Icons.alarm_on,
    Icons.emoji_people,
    Icons.article_outlined,
    Icons.info,
    Icons.language,
  ];

  final List routes = [
    HomePage(),
    HomePage(),
    Blogs(),
    PrivacyPolicy(),
    Language(),
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
                      title: Text("Frank Wolf",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 17)),
                      subtitle: GestureDetector(
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
                      itemCount: 5,
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
