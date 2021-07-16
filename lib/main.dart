import 'package:trainertimer/Locale/languageCubit.dart';
import 'package:trainertimer/Pages/Drawer/changeLanguage.dart';
import 'package:trainertimer/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Locale/locales.dart';
import 'Routes/routes.dart';
import 'Theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FitZone());
}

class FitZone extends StatelessWidget {
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
            home: HomePage(),
            debugShowCheckedModeBanner: false,
            routes: PageRoutes().routes(),
          );
        },
      ),
    );
  }
}
