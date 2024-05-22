import 'dart:ui';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
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
                  'Impressum',
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
                            Text('Alarm4u.de GmbH',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('Meußlitzer Str. 58',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('01259 Dresden',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('Deutschland',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Handelsregister: HRB 28245',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('Registergericht: Dresden',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('Vertreten durch: Frank Wolf',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Internet: trainertimer.de',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
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

                            SizedBox(
                              height: 20,
                            ),
                            Text('Lizensierte Bilder: stock.adobe.com',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('ID - Lizenz - Autor',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 11)),

                            Text('''
 #326432693 - Standard - © Prostock-studio	
 #344007004 - Standard - © sudjinah 	
 #302201067 - Standard - © Drobot Dean 	
 #297556353 - Standard - © Drobot Dean 	
 #297556758 - Standard - © Drobot Dean 	
 #236846281 - Standard - © AkimD 	
 #60282628  - Standard - © pio3 	
 #59283783  - Standard - © pio3 	
 #62255075  - Standard - © pio3 	
 #60282534  - Standard - © pio3 	''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 11)),

                            SizedBox(
                              height: 20,
                            ),
                            Text('Entwickelt mit: Flutter SDK',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 13)),
                            Text('flutter.dev',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 11)),

                            Text('''
Danke an Google für das Flutter SDK und and viele andere die Codepakete: audioplayers, audiocache, gaptimer_controller, circular_countdown, path_provider, flutter_bloc, animation_wrappers, shared_preferences, animated_theme_switcher, image_picker, hive und wakelock <- wie cool ist das denn?
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
