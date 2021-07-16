import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import '/Theme/colors.dart';
import 'package:flutter/material.dart';

class ReadBlog extends StatelessWidget {
  final String? title;
  final String img;
  ReadBlog(this.title, this.img);

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.chevron_left),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Opacity(
          opacity: 0.6,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    img,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        bottom: PreferredSize(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 80,
              child: FadedScaleAnimation(
                Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 20, color: Colors.white),
                ),
                durationInMilliseconds: 1000,
              ),
            ),
            preferredSize: Size.fromHeight(115)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
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
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[800]!.withOpacity(0.5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("24 March'21",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 12, color: darkGrey)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(locale.lorem!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(locale.lorem!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13)),
                        Text(locale.lorem!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(locale.lorem!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13)),
                        Text(locale.lorem!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
