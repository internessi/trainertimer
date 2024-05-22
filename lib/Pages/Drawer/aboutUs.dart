import 'dart:ui';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
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
                  'We want you!',
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
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            height: 80,
                            child: Image.asset("assets/logo.png"),
                          ),
                          //durationInMilliseconds: 1000,
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
                            Text('We want you!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('(gestalte den Trainertimer mit)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 11)),

                            Text ('''

Du bist Kampfsportler mit langer Erfahrung in Boxen, Muay Thai, Kickboxen, Jiu Jitsu, Capoeira, Judo, Karate, Kendo,  Krav Maga, Aikido, Luta Livre,  Ringen, Systema, Taekwondo, Wing Chun, Fechten, Hapkido, Jeet Kune Do, Wrestling oder so? Cool, lass uns das einbauen!

Du bist Muttersprachler in einer coolen Sprache und Kampfsportler? Perfekt - ich habe die App für andere Sprachen vorbereitet!

Wenn Du als Trainer und dieses Projekt bereichern möchtest, gerne! Die Aufnahme der Schnipsel dauert ca. eine Stunde, ich sende Dir einen Audiorecorder und eine Vorschlagliste für die Kommandos.

Du hast eine gute Idee für ein geändertes oder neues Feature, meine Email und Telefonnummer findest Du unten. 

Soweit, erstmal viel Spass beim Training,
Frank Wolf
''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 11)),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Email: info@trainertimer.de',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('Telefon: +49 (0)351 313 7790',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('(ich melde mich mit Alarm4u.de GmbH ;)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 9)),
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
