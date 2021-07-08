import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import '/Locale/locales.dart';
import '/Pages/Home/Drawer/readBlog.dart';
import '/Pages/Home/Drawer/setAlarm.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class Blogs extends StatelessWidget {
  final List imgs = [
    "assets/blog/Featured img.png",
    "assets/blog/Layer 626.png",
    "assets/blog/Layer 654.png",
    "assets/blog/Layer 686.png",
    "assets/blog/Layer 686-1.png",
    "assets/blog/Layer 626.png",
    "assets/blog/Layer 654.png",
    "assets/blog/Layer 686.png",
  ];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List title = [
      locale.handStand,
      locale.top6,
      locale.weightlifting,
      locale.fitShaming,
      locale.handStand,
      locale.top6,
      locale.weightlifting,
      locale.fitShaming,
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                titleSpacing: 0,
                backgroundColor: Colors.grey[800]!.withOpacity(0.3),
                title: Text(
                  locale.blogs!,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                ),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.alarm_on,
                        color: greyColor,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetAlarm()));
                      })
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      body: Container(
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 20),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ReadBlog(title[index], imgs[index])));
                      },
                      child: FadedSlideAnimation(
                        ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 115,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[800]!.withOpacity(0.3),
                              ),
                              child: Row(
                                children: [
                                  FadedScaleAnimation(
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(imgs[index]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                        ),
                                      ),
                                      height: 110,
                                      width: 100,
                                    ),
                                    durationInMilliseconds: 1000,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(title[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(fontSize: 12)),
                                          Spacer(),
                                          Text(
                                            "13 April' 21",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    fontSize: 11,
                                                    color: darkGrey),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        beginOffset: Offset(0.4, 0),
                        endOffset: Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
