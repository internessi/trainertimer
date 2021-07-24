import 'dart:ui';
import 'package:animation_wrappers/animation_wrappers.dart';
import '../../MySubs/colorButton.dart';
import '/Locale/languageCubit.dart';
import '/Locale/locales.dart';
import '../../MySubs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Language extends StatefulWidget {
  final bool isStart;

  Language([this.isStart = false]);
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late LanguageCubit _languageCubit;

  int? _selectedLanguage = -1;

  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List languages = [
      locale.ger,
      locale.eng,
      //  locale.arab,
      //   locale.frnch,
      //   locale.prtguese,
      //   locale.indonesia,
      //   locale.spansh,
      //   locale.italy,
      //   locale.swahilii,
      //   locale.turk
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
                  "Change Language",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
                ),
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
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            color: Colors.grey[800]!.withOpacity(0.5),
                            child: RadioListTile(
                              activeColor: buttonColor,
                              title: Text(languages[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 17)),
                              value: index,
                              groupValue: _selectedLanguage,
                              onChanged: (dynamic val) {
                                setState(() {
                                  _selectedLanguage = val;
                                  print(val);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: GestureDetector(
                          onTap: () {
                            if (_selectedLanguage == 0) {
                              _languageCubit.selectGerLanguage();
                            } else if (_selectedLanguage == 1) {
                              _languageCubit.selectEngLanguage();
                              //  } else if (_selectedLanguage == 1) {
                              //    _languageCubit.selectArabicLanguage();
                              // } else if (_selectedLanguage == 2) {
                              //   _languageCubit.selectFrenchLanguage();
                              // } else if (_selectedLanguage == 3) {
                              //    _languageCubit.selectPortugueseLanguage();
                              // } else if (_selectedLanguage == 4) {
                              //    _languageCubit.selectIndonesianLanguage();
                              //  } else if (_selectedLanguage == 5) {
                              //    _languageCubit.selectSpanishLanguage();
                              //  } else if (_selectedLanguage == 6) {
                              //    _languageCubit.selectItalianLanguage();
                              //  } else if (_selectedLanguage == 7) {
                              //   _languageCubit.selectSwahiliLanguage();
                              //  } else if (_selectedLanguage == 8) {
                              //     _languageCubit.selectTurkishLanguage();
                            }
                              Navigator.pop(context);
                          },
                          child: FadedScaleAnimation(
                            ColorButton(locale.submit),
                            durationInMilliseconds: 1000,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
