import 'dart:ui';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import 'package:flutter/material.dart';

class NoTrackintNoAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: AppBar(
                title: Text(
                  'NoTracking - NoAds - NoSpy',
                  style: TextStyle(fontSize: 17),
                ),
                backgroundColor: Colors.grey[800]!.withOpacity(0.5),
                leading: IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                bottom: PreferredSize(
                    child: Column(
                      children: [
                        FadedScaleAnimation(
                    child:  Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            height: 80,
                            child: Image.asset("assets/logo.png"),
                          ),
                          // durationInMilliseconds: 1000,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    preferredSize: Size.fromHeight(95)),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(130)),
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
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[800]!.withOpacity(0.5)),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Text('NoTracking - NoAds - NoSpy',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('(ein paar Worte in eigener Sache)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 11)),
                            Text ('''
                            
Diese App wurde mit Flutter für Android- und IOS Mobiltelefone (warscheinlich kompatibel zu Handys der letzten 5 Jahre) von mir entwickelt. Klar will man mit einer App Geld verdienen, dies stand aber nicht im Vordergrund bei der Entwicklung.

Ich mag es nicht wenn man ständig mit nerfiger und sinnloser Werbung bombardiert wird, wenn eine App ohne Nutzen für mich nach meinen Daten wie Email, Namen und mehr fragt. Sinnloses Tracking natülich genau so.

Und deshalb werde ich das nicht machen! Diese App wird Dich nicht mit sinnloser Werbung nerfen, deine Daten oder Deinen Standort haben wollen. 

Wenn es in Zukunft kostenpflichtige Trainer gibt, dann über den Store. Sollte ein Sportartikelvertrieb einen Trainer sponsern - dann könnte es vor dem Training mit diesem gesponserten Trainer eine passende, aktuelle Werbeeinblendung (Boxhandschuhe, Bandagen, Boxsack usw.) geben.

Sollte ein Verband/Verein/Dojo/Sensei usw. ein Audiotraining/Trainer für die eigenen Mitglieder sponsern, erfolgt die Freischaltung über einen Code/QR ohne persöhnliche Daten.

Soweit, viel Spass beim Training,
Frank Wolf
''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 11)),
                            SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
