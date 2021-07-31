import 'dart:ui';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import '/Locale/locales.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
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
                  locale.privacyPolicy!,
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
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            height: 80,
                            child: Image.asset("assets/logo.png"),
                          ),
                          durationInMilliseconds: 1000,
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
                            Text('''
Anbieter und Verantwortlicher
                                    ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 13)),
                            Text('''
Alarm4u.de GmbH, Meußlitzer Str. 58, 01259 Dresden, Deutschland, Handelsregister: HRB 28245, Registergericht: Dresden, Vertreten durch: Frank Wolf, E-Mail-Adresse des Anbieters: info@trainertimer.de
''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 10)),
                            SizedBox(
                              height: 20,
                            ),
                            Text('''
Arten der erhobenen Daten
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 13)),
                            Text('''
Zu den personenbezogenen Daten, die diese Anwendung selbstständig oder durch Dritte verarbeitet, gehören: Vorname; Nachname; Telefonnummer; E-Mail; Profilbild; Tracker; Nutzungsdaten; Eindeutige Gerätekennzeichnung für Werbung (Google-Werbe-ID oder IDFA, beispielsweise); Geografische Position; Sprache; Während der Nutzung des Dienstes übermittelte Daten; Geräteinformationen; Anwendung-Ausführungen; Kalenderberechtigung; Kameraberechtigung; Berechtigung zur Ermittlung des genauen Standorts (nicht kontinuierlich); Berechtigung zur Ermittlung des ungefähren Standorts (nicht kontinuierlich); Mikrofonberechtigung; Bluetooth-Freigabeberechtigung; Fotobibliothekberechtigung; Informationen über die Anwendung; Gerätelogs; verschiedene Datenarten; Geburtsdatum; physische Adresse; Beruf; Land; Staat; Postleitzahl; Stadt; Bild; Arbeitsplatz; Anzahl der Beschäftigten; Tätigkeitsgebiet; Hausnummer.
Vollständige Details zu jeder Art von verarbeiteten personenbezogenen Daten werden in den dafür vorgesehenen Abschnitten dieser Datenschutzerklärung oder punktuell durch Erklärungstexte bereitgestellt, die vor der Datenerhebung angezeigt werden.
Personenbezogene Daten können vom Nutzer freiwillig angegeben oder, im Falle von Nutzungsdaten, automatisch erhoben werden, wenn diese Anwendung genutzt wird.
Sofern nicht anders angegeben, ist die Angabe aller durch diese Anwendung angeforderten Daten obligatorisch. Weigert sich der Nutzer, die Daten anzugeben, kann dies dazu führen, dass diese Anwendung dem Nutzer ihre Dienste nicht zur Verfügung stellen kann. In Fällen, in denen diese Anwendung die Angabe personenbezogener Daten ausdrücklich als freiwillig bezeichnet, dürfen sich die Nutzer dafür entscheiden, diese Daten ohne jegliche Folgen für die Verfügbarkeit oder die Funktionsfähigkeit des Dienstes nicht anzugeben.
Nutzer, die sich darüber im Unklaren sind, welche personenbezogenen Daten obligatorisch sind, können sich an den Anbieter wenden.
Jegliche Verwendung von Cookies – oder anderer Tracking-Tools – durch diese Anwendung oder Anbieter von Drittdiensten, die durch diese Anwendung eingesetzt werden, dient dem Zweck, den vom Nutzer gewünschten Dienst zu erbringen, und allen anderen Zwecken, die im vorliegenden Dokument und, falls vorhanden, in der Cookie-Richtlinie beschrieben sind.
Die Nutzer sind für alle personenbezogenen Daten Dritter verantwortlich, die durch diese Anwendung beschafft, veröffentlicht oder weitergegeben werden, und bestätigen, dass sie die Zustimmung zur Übermittlung personenbezogener Daten etwaiger Dritter an diese Anwendung eingeholt haben.
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 10)),
                            Text('''
Verarbeitungsmethoden
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 13)),
                            Text('''
Der Anbieter verarbeitet die Nutzerdaten auf ordnungsgemäße Weise und ergreift angemessene Sicherheitsmaßnahmen, um den unbefugten Zugriff und die unbefugte Weiterleitung, Veränderung oder Vernichtung von Daten zu vermeiden.
Die Datenverarbeitung wird mittels Computern oder IT-basierten Systemen nach organisatorischen Verfahren und Verfahrensweisen durchgeführt, die gezielt auf die angegebenen Zwecke abstellen. Zusätzlich zum Verantwortlichen könnten auch andere Personen intern (Personalverwaltung, Vertrieb, Marketing, Rechtsabteilung, Systemadministratoren) oder extern – und in dem Fall soweit erforderlich, vom Verantwortlichen als Auftragsverarbeiter benannt (wie Anbieter technischer Dienstleistungen, Zustellunternehmen, Hosting-Anbieter, IT-Unternehmen oder Kommunikationsagenturen) - diese Anwendung betreiben und damit Zugriff auf die Daten haben. Eine aktuelle Liste dieser Beteiligten kann jederzeit vom Anbieter verlangt werden.
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 10)),
                            Text('''
Rechtsgrundlagen der Verarbeitung
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 13)),
                            Text('''
Der Anbieter darf personenbezogene Daten von Nutzern nur dann verarbeiten, wenn einer der folgenden Punkte zutrifft:
    Die Nutzer haben ihre Einwilligung für einen oder mehrere bestimmte Zwecke erteilt. Hinweis: In einigen Gesetzgebungen kann es dem Anbieter gestattet sein, personenbezogene Daten zu verarbeiten, bis der Nutzer einer solchen Verarbeitung widerspricht („Opt-out“), ohne sich auf die Einwilligung oder eine andere der folgenden Rechtsgrundlagen verlassen zu müssen. Dies gilt jedoch nicht, wenn die Verarbeitung personenbezogener Daten dem europäischen Datenschutzrecht unterliegt;
    die Datenerhebung ist für die Erfüllung eines Vertrages mit dem Nutzer und/oder für vorvertragliche Maßnahmen daraus erforderlich;
    die Verarbeitung ist für die Erfüllung einer rechtlichen Verpflichtung, der der Anbieter unterliegt, erforderlich;
    die Verarbeitung steht im Zusammenhang mit einer Aufgabe, die im öffentlichen Interesse oder in Ausübung hoheitlicher Befugnisse, die dem Anbieter übertragen wurden, durchgeführt wird;
    die Verarbeitung ist zur Wahrung der berechtigten Interessen des Anbieters oder eines Dritten erforderlich.
In jedem Fall erteilt der Anbieter gerne Auskunft über die konkrete Rechtsgrundlage, auf der die Verarbeitung beruht, insbesondere darüber, ob die Angabe personenbezogener Daten eine gesetzliche oder vertragliche Verpflichtung oder eine Voraussetzung für den Abschluss eines Vertrages ist.
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 10)),
                            Text('''
Ort
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 13)),
                            Text('''
Die Daten werden in der Niederlassung des Anbieters und an allen anderen Orten, an denen sich die an der Datenverarbeitung beteiligten Stellen befinden, verarbeitet.
Je nach Standort der Nutzer können Datenübertragungen die Übertragung der Daten des Nutzers in ein anderes Land als das eigene beinhalten. Um mehr über den Ort der Verarbeitung der übermittelten Daten zu erfahren, können die Nutzer den Abschnitt mit den ausführlichen Angaben zur Verarbeitung der personenbezogenen Daten konsultieren.
Die Nutzer haben auch das Recht, sich über die Rechtsgrundlage der Datenübermittlung in ein Land außerhalb der Europäischen Union oder an eine internationale Organisation, die dem Völkerrecht unterliegt oder von zwei oder mehr Ländern gegründet wurde, wie beispielsweise die UNO, sowie sich über die vom Anbieter ergriffenen Sicherheitsmaßnahmen zum Schutz ihrer Daten aufklären zu lassen.
Wenn eine solche Übermittlung stattfindet, kann der Nutzer mehr darüber erfahren, indem er die entsprechenden Abschnitte dieses Dokuments überprüft oder sich mit dem Anbieter über die im Kontaktteil angegebenen Informationen in Verbindung setzt.
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 10)),
                            Text('''
Speicherdauer
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 13)),
                            Text('''
Personenbezogene Daten werden so lange verarbeitet und gespeichert, wie es der Zweck erfordert, zu dem sie erhoben wurden.
Daher gilt:
    Personenbezogene Daten, die zu Zwecken der Erfüllung eines zwischen dem Anbieter und dem Nutzer geschlossenen Vertrages erhoben werden, werden bis zur vollständigen Erfüllung dieses Vertrages gespeichert.
    Personenbezogene Daten, die zur Wahrung der berechtigten Interessen des Anbieters erhoben werden, werden so lange aufbewahrt, wie es zur Erfüllung dieser Zwecke erforderlich ist. Nutzer können nähere Informationen über die berechtigten Interessen des Anbieters in den entsprechenden Abschnitten dieses Dokuments oder durch Kontaktaufnahme zum Anbieter erhalten.
Darüber hinaus ist es dem Anbieter gestattet, personenbezogene Daten für einen längeren Zeitraum zu speichern, wenn der Nutzer in eine solche Verarbeitung eingewilligt hat, solange die Einwilligung nicht widerrufen wird. Darüber hinaus kann der Anbieter verpflichtet sein, personenbezogene Daten für einen längeren Zeitraum aufzubewahren, wenn dies zur Erfüllung einer gesetzlichen Verpflichtung oder auf Anordnung einer Behörde erforderlich ist.
Nach Ablauf der Aufbewahrungsfrist werden personenbezogene Daten gelöscht. Daher können das Auskunftsrecht, das Recht auf Löschung, das Recht auf Berichtigung und das Recht auf Datenübertragbarkeit nach Ablauf der Aufbewahrungsfrist nicht geltend gemacht werden.

Zwecke der Verarbeitung
Personenbezogene Daten über den Nutzer werden erhoben, damit der Anbieter den Dienst erbringen und des Weiteren seinen gesetzlichen Verpflichtungen nachkommen, auf Durchsetzungsforderungen reagieren, seine Rechte und Interessen (oder die der Nutzer oder Dritter) schützen, böswillige oder betrügerische Aktivitäten aufdecken kann. Darüber hinaus werden Daten zu folgenden Zwecken erhoben: Registrierung und Anmeldung, Verwalten von Kontakten und Versenden von Nachrichten, Standortbezogene Interaktionen, Hosting und Backend-Infrastruktur, Interaktion mit Live-Chat-Plattformen, Verwaltung von Support- und Kontaktanfragen, Umgang mit Zahlungen, Geräteberechtigungen für den Zugriff auf personenbezogene Daten, Plattform-Dienste und Hosting, Anzeigen von Inhalten externer Plattformen, Werbung, Soziale Funktionen, Analytik, Beta-Tests, Datenübermittlung außerhalb der EU und Registrierung und Anmeldung unmittelbar über diese Anwendung.
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 10)),
                            Text('''
Zwecke der Verarbeitung
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 13)),
                            Text('''
Personenbezogene Daten über den Nutzer werden erhoben, damit der Anbieter den Dienst erbringen und des Weiteren seinen gesetzlichen Verpflichtungen nachkommen, auf Durchsetzungsforderungen reagieren, seine Rechte und Interessen (oder die der Nutzer oder Dritter) schützen, böswillige oder betrügerische Aktivitäten aufdecken kann. Darüber hinaus werden Daten zu folgenden Zwecken erhoben: Registrierung und Anmeldung, Verwalten von Kontakten und Versenden von Nachrichten, Standortbezogene Interaktionen, Hosting und Backend-Infrastruktur, Interaktion mit Live-Chat-Plattformen, Verwaltung von Support- und Kontaktanfragen, Umgang mit Zahlungen, Geräteberechtigungen für den Zugriff auf personenbezogene Daten, Plattform-Dienste und Hosting, Anzeigen von Inhalten externer Plattformen, Werbung, Soziale Funktionen, Analytik, Beta-Tests, Datenübermittlung außerhalb der EU und Registrierung und Anmeldung unmittelbar über diese Anwendung.
                            ''',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontSize: 10)),
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
