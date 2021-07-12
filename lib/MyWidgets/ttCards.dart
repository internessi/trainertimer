import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import '/Theme/colors.dart';
import '/Locale/locales.dart';

class TraierTimerCard extends StatelessWidget {
  final String? title1, title2, footer;
  final String image;
  final int index, style, gerFlag, engFlag, ruFlag;


  TraierTimerCard(this.title1, this.title2, this.footer, this.image, this.index,
                  this.style, this.gerFlag, this.engFlag, this.ruFlag);

  @override
  Widget build(BuildContext context) {

    var locale = AppLocalizations.of(context)!;
    return

      Container(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 103,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[800]!.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  FadedScaleAnimation(
                    Container(
                      height: 110,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    durationInMilliseconds: 1000,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: 10,
                              top: 7,
                              left: 10),
                          child: style == 0 ?
                          Row(
                            children: [
                              Spacer(),
                              Icon(
                                Icons.headset_rounded,
                                color: darkGrey,
                                size: 18,
                              ),
                              if (engFlag == 1)
                                SizedBox(width: 7),
                              if (engFlag == 1)
                                Container(
                                  height: 14,
                                  child:
                                  Image.asset(
                                      "assets/imgs/usuk7.png",
                                      fit: BoxFit.scaleDown
                                  ),
                                ),
                              if (gerFlag == 1)
                              SizedBox(width: 7),
                              if (gerFlag == 1)
                              Container(
                                height: 14,
                                child:
                                Image.asset(
                                    "assets/imgs/ger7.png",
                                    fit: BoxFit.scaleDown
                                ),
                              ),
                            ],
                          ):
                          Row(
                            children: [
                              Spacer(),
                              Container(
                                height: 18,
                                child:
                                Icon(
                                  Icons.timer,
                                  color: index == 1 ||
                                      index == 2
                                      ? buttonColor
                                      : greyColor,
                                  size: 15,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                height: 18,
                                child:
                                Icon(
                                  Icons.access_time_rounded,
                                  color: index == 1 ||
                                      index == 2
                                      ? buttonColor
                                      : greyColor,
                                  size: 15,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                height: 18,
                                child:
                                Icon(
                                  Icons.timelapse_sharp,
                                  color: index == 1 ||
                                      index == 2
                                      ? buttonColor
                                      : greyColor,
                                  size: 15,
                                ),
                              ),
                              SizedBox(width: 5),
                            ],
                          )
                        ),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(title1!
                                .toUpperCase()),
                            Text(title2!
                                .toUpperCase()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              footer!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                  fontSize: 11,
                                  color: darkGrey),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}