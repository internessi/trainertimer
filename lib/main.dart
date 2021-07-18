import 'package:trainertimer/Locale/languageCubit.dart';
import 'package:trainertimer/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Locale/locales.dart';
import 'MySubs/routes.dart';
import 'Theme/style.dart';
import 'package:trainertimer/User/mainUsers.dart';
import 'package:trainertimer/User/utils/user_preferences.dart';
import 'package:trainertimer/MySubs/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  await StoreTimerPreferences.init();
  runApp(TrainerTimer());
}

class TrainerTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageCubit>(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (_, locale) {
          return MaterialApp(
            localizationsDelegates: [
              const AppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('de'),
              const Locale('en'),
              //  const Locale('ar'),
              //  const Locale('pt'),
              //  const Locale('fr'),
              //  const Locale('id'),
              //  const Locale('es'),
              //  const Locale('tr'),
              //  const Locale('it'),
              //  const Locale('sw'),
            ],
            locale: locale,
            theme: appTheme,
            // home: Language(true),
            home:Login(),
            debugShowCheckedModeBanner: false,
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }
}
