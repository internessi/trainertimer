import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';
import 'Languages/german.dart';
import 'Languages/english.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'de': german(),
    'en': english(),
    // 'ar': arabic(),
    // 'pt': portuguese(),
    // 'fr': french(),
    // 'id': indonesian(),
    // 'es': spanish(),
    // 'tr': turkish(),
    // 'it': italian(),
    // 'sw': swahili()
  };

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get password {
    return _localizedValues[locale.languageCode]!['password'];
  }

  String? get createAccount {
    return _localizedValues[locale.languageCode]!['createAccount'];
  }

  String? get privacyPolicy {
    return _localizedValues[locale.languageCode]!['privacyPolicy'];
  }

  String? get createNewAccount {
    return _localizedValues[locale.languageCode]!['createNewAccount'];
  }

  String? get aboutUs {
    return _localizedValues[locale.languageCode]!['aboutUs'];
  }

  String? get bySigningUp {
    return _localizedValues[locale.languageCode]!['bySigningUp'];
  }

  String? get tnc {
    return _localizedValues[locale.languageCode]!['tnc'];
  }

  String? get forgot {
    return _localizedValues[locale.languageCode]!['forgot'];
  }

  String? get facebook {
    return _localizedValues[locale.languageCode]!['facebook'];
  }

  String? get google {
    return _localizedValues[locale.languageCode]!['google'];
  }

  String? get notRegisteredYet {
    return _localizedValues[locale.languageCode]!['notRegisteredYet'];
  }

  String? get forgotPassword {
    return _localizedValues[locale.languageCode]!['forgotPassword'];
  }

  String? get provideYourEmail {
    return _localizedValues[locale.languageCode]!['provideYourEmail'];
  }

  String? get signInNow {
    return _localizedValues[locale.languageCode]!['signInNow'];
  }

  String? get continuee {
    return _localizedValues[locale.languageCode]!['continuee'];
  }

  String? get signIn {
    return _localizedValues[locale.languageCode]!['signIn'];
  }

  String? get enterEmailAddress {
    return _localizedValues[locale.languageCode]!['enterEmailAddress'];
  }

  String? get backto {
    return _localizedValues[locale.languageCode]!['backto'];
  }

  String? get createYourAccount {
    return _localizedValues[locale.languageCode]!['createYourAccount'];
  }

  String? get createPassword {
    return _localizedValues[locale.languageCode]!['createPassword'];
  }

  String? get login {
    return _localizedValues[locale.languageCode]!['login'];
  }

  String? get workout {
    return _localizedValues[locale.languageCode]!['workout'];
  }

  String? get chest {
    return _localizedValues[locale.languageCode]!['chest'];
  }

  String? get next {
    return _localizedValues[locale.languageCode]!['next'];
  }

  String? get beginner {
    return _localizedValues[locale.languageCode]!['beginner'];
  }

  String? get intermediate {
    return _localizedValues[locale.languageCode]!['intermediate'];
  }

  String? get advanced {
    return _localizedValues[locale.languageCode]!['advanced'];
  }

  String? get arm {
    return _localizedValues[locale.languageCode]!['arm'];
  }

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get back {
    return _localizedValues[locale.languageCode]!['back'];
  }

  String? get legs {
    return _localizedValues[locale.languageCode]!['legs'];
  }

  String? get shoulders {
    return _localizedValues[locale.languageCode]!['shoulders'];
  }

  String? get workouts {
    return _localizedValues[locale.languageCode]!['workouts'];
  }

  String? get level {
    return _localizedValues[locale.languageCode]!['level'];
  }

  String? get jumpingJacks {
    return _localizedValues[locale.languageCode]!['jumpingJacks'];
  }

  String? get inclinePushUps {
    return _localizedValues[locale.languageCode]!['inclinePushUps'];
  }

  String? get pushups {
    return _localizedValues[locale.languageCode]!['pushups'];
  }

  String? get benchpressPushups {
    return _localizedValues[locale.languageCode]!['benchpressPushups'];
  }

  String? get wideHandPushUps {
    return _localizedValues[locale.languageCode]!['wideHandPushUps'];
  }

  String? get shortHand {
    return _localizedValues[locale.languageCode]!['shortHand'];
  }

  String? get letsStart {
    return _localizedValues[locale.languageCode]!['letsStart'];
  }

  String? get goodGoing {
    return _localizedValues[locale.languageCode]!['goodGoing'];
  }

  String? get takeRest {
    return _localizedValues[locale.languageCode]!['takeRest'];
  }

  String? get secs {
    return _localizedValues[locale.languageCode]!['secs'];
  }

  String? get skip {
    return _localizedValues[locale.languageCode]!['skip'];
  }

  String? get setAlarm {
    return _localizedValues[locale.languageCode]!['setAlarm'];
  }

  String? get blogs {
    return _localizedValues[locale.languageCode]!['blogs'];
  }

  String? get rateUs {
    return _localizedValues[locale.languageCode]!['rateUs'];
  }

  String? get userName {
    return _localizedValues[locale.languageCode]!['userName'];
  }

  String? get gender {
    return _localizedValues[locale.languageCode]!['gender'];
  }

  String? get birthdate {
    return _localizedValues[locale.languageCode]!['birthdate'];
  }

  String? get country {
    return _localizedValues[locale.languageCode]!['country'];
  }

  String? get label {
    return _localizedValues[locale.languageCode]!['label'];
  }

  String? get alarmRingtone {
    return _localizedValues[locale.languageCode]!['alarmRingtone'];
  }

  String? get alarms {
    return _localizedValues[locale.languageCode]!['alarms'];
  }

  String? get everyday {
    return _localizedValues[locale.languageCode]!['everyday'];
  }

  String? get itsWorkoutTime {
    return _localizedValues[locale.languageCode]!['itsWorkoutTime'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get healthyFood {
    return _localizedValues[locale.languageCode]!['healthyFood'];
  }

  String? get eveningWalk {
    return _localizedValues[locale.languageCode]!['eveningWalk'];
  }

  String? get alarmClock {
    return _localizedValues[locale.languageCode]!['alarmClock'];
  }

  String? get handStand {
    return _localizedValues[locale.languageCode]!['handStand'];
  }

  String? get top6 {
    return _localizedValues[locale.languageCode]!['top6'];
  }

  String? get weightlifting {
    return _localizedValues[locale.languageCode]!['weightlifting'];
  }

  String? get fitShaming {
    return _localizedValues[locale.languageCode]!['fitShaming'];
  }

  String? get ratings {
    return _localizedValues[locale.languageCode]!['ratings'];
  }

  String? get sortBy {
    return _localizedValues[locale.languageCode]!['sortBy'];
  }

  String? get male {
    return _localizedValues[locale.languageCode]!['male'];
  }

  String? get female {
    return _localizedValues[locale.languageCode]!['female'];
  }

  String? get applyNow {
    return _localizedValues[locale.languageCode]!['applyNow'];
  }

  String? get about {
    return _localizedValues[locale.languageCode]!['about'];
  }

  String? get overview {
    return _localizedValues[locale.languageCode]!['overview'];
  }

  String? get availablity {
    return _localizedValues[locale.languageCode]!['availablity'];
  }

  String? get availableAt {
    return _localizedValues[locale.languageCode]!['availableAt'];
  }

  String? get address {
    return _localizedValues[locale.languageCode]!['address'];
  }

  String? get services {
    return _localizedValues[locale.languageCode]!['services'];
  }

  String? get specialization {
    return _localizedValues[locale.languageCode]!['specialization'];
  }

  String? get alsoPracticesAt {
    return _localizedValues[locale.languageCode]!['alsoPracticesAt'];
  }

  String? get availableTimings {
    return _localizedValues[locale.languageCode]!['availableTimings'];
  }

  String? get bookAppointmentNow {
    return _localizedValues[locale.languageCode]!['bookAppointmentNow'];
  }

  String? get overall {
    return _localizedValues[locale.languageCode]!['overall'];
  }

  String? get visitedFor {
    return _localizedValues[locale.languageCode]!['visitedFor'];
  }

  String? get giveFeedback {
    return _localizedValues[locale.languageCode]!['giveFeedback'];
  }

  String? get selectDateTime {
    return _localizedValues[locale.languageCode]!['selectDateTime'];
  }

  String? get at {
    return _localizedValues[locale.languageCode]!['at'];
  }

  String? get availableTimes {
    return _localizedValues[locale.languageCode]!['availableTimes'];
  }

  String? get appointmentFor {
    return _localizedValues[locale.languageCode]!['appointmentFor'];
  }

  String? get done {
    return _localizedValues[locale.languageCode]!['done'];
  }

  String? get overallExperience {
    return _localizedValues[locale.languageCode]!['overallExperience'];
  }

  String? get visitedDoctorfor {
    return _localizedValues[locale.languageCode]!['visitedDoctorfor'];
  }

  String? get egHeart {
    return _localizedValues[locale.languageCode]!['egHeart'];
  }

  String? get howWasExperience {
    return _localizedValues[locale.languageCode]!['howWasExperience'];
  }

  String? get writeYourexperience {
    return _localizedValues[locale.languageCode]!['writeYourexperience'];
  }

  String? get submitFeedback {
    return _localizedValues[locale.languageCode]!['submitFeedback'];
  }

  String? get askDoctor {
    return _localizedValues[locale.languageCode]!['askDoctor'];
  }

  String? get describleYourIssue {
    return _localizedValues[locale.languageCode]!['describleYourIssue'];
  }

  String? get treatmentType {
    return _localizedValues[locale.languageCode]!['treatmentType'];
  }

  String? get title {
    return _localizedValues[locale.languageCode]!['title'];
  }

  String? get tapToaddTitle {
    return _localizedValues[locale.languageCode]!['tapToaddTitle'];
  }

  String? get describeIssue {
    return _localizedValues[locale.languageCode]!['describeIssue'];
  }

  String? get fileAttchment {
    return _localizedValues[locale.languageCode]!['fileAttchment'];
  }

  String? get uploadFile {
    return _localizedValues[locale.languageCode]!['uploadFile'];
  }

  String? get submitQuestion {
    return _localizedValues[locale.languageCode]!['submitQuestion'];
  }

  String? get labsAndTests {
    return _localizedValues[locale.languageCode]!['labsAndTests'];
  }

  String? get searchForTests {
    return _localizedValues[locale.languageCode]!['searchForTests'];
  }

  String? get labsInfo {
    return _localizedValues[locale.languageCode]!['labsInfo'];
  }

  String? get timings {
    return _localizedValues[locale.languageCode]!['timings'];
  }

  String? get getDirection {
    return _localizedValues[locale.languageCode]!['getDirection'];
  }

  String? get facilities {
    return _localizedValues[locale.languageCode]!['facilities'];
  }

  String? get parkingNotAvailable {
    return _localizedValues[locale.languageCode]!['parkingNotAvailable'];
  }

  String? get eReports {
    return _localizedValues[locale.languageCode]!['eReports'];
  }

  String? get cardAccepted {
    return _localizedValues[locale.languageCode]!['cardAccepted'];
  }

  String? get prescriptionPickup {
    return _localizedValues[locale.languageCode]!['prescriptionPickup'];
  }

  String? get reportDoorstep {
    return _localizedValues[locale.languageCode]!['reportDoorstep'];
  }

  String? get parkingNotAv {
    return _localizedValues[locale.languageCode]!['parkingNotAv'];
  }

  String? get message {
    return _localizedValues[locale.languageCode]!['message'];
  }

  String? get search {
    return _localizedValues[locale.languageCode]!['search'];
  }

  String? get searchTest {
    return _localizedValues[locale.languageCode]!['searchTest'];
  }

  String? get medicalShops {
    return _localizedValues[locale.languageCode]!['medicalShops'];
  }

  String? get open {
    return _localizedValues[locale.languageCode]!['open'];
  }

  String? get openNow {
    return _localizedValues[locale.languageCode]!['openNow'];
  }

  String? get myAppointments {
    return _localizedValues[locale.languageCode]!['myAppointments'];
  }

  String? get upcomingAppointments {
    return _localizedValues[locale.languageCode]!['upcomingAppointments'];
  }

  String? get pastAppointments {
    return _localizedValues[locale.languageCode]!['pastAppointments'];
  }

  String? get appointmentDetail {
    return _localizedValues[locale.languageCode]!['appointmentDetail'];
  }

  String? get cancel {
    return _localizedValues[locale.languageCode]!['cancel'];
  }

  String? get appointmentDateTime {
    return _localizedValues[locale.languageCode]!['appointmentDateTime'];
  }

  String? get in3Days {
    return _localizedValues[locale.languageCode]!['in3Days'];
  }

  String? get appointmentBookedFor {
    return _localizedValues[locale.languageCode]!['appointmentBookedFor'];
  }

  String? get appointmentNumber {
    return _localizedValues[locale.languageCode]!['appointmentNumber'];
  }

  String? get justForRef {
    return _localizedValues[locale.languageCode]!['justForRef'];
  }

  String? get yesSure {
    return _localizedValues[locale.languageCode]!['yesSure'];
  }

  String? get keepaway {
    return _localizedValues[locale.languageCode]!['keepaway'];
  }

  String? get okayMam {
    return _localizedValues[locale.languageCode]!['okayMam'];
  }

  String? get yourTestReport {
    return _localizedValues[locale.languageCode]!['yourTestReport'];
  }

  String? get helloDoctor {
    return _localizedValues[locale.languageCode]!['helloDoctor'];
  }

  String? get helloHowMay {
    return _localizedValues[locale.languageCode]!['helloHowMay'];
  }

  String? get thankYouActually {
    return _localizedValues[locale.languageCode]!['thankYouActually'];
  }

  String? get writeYourMessage {
    return _localizedValues[locale.languageCode]!['writeYourMessage'];
  }

  String? get myAccount {
    return _localizedValues[locale.languageCode]!['myAccount'];
  }

  String? get completeProfile {
    return _localizedValues[locale.languageCode]!['completeProfile'];
  }

  String? get myFeedbacks {
    return _localizedValues[locale.languageCode]!['myFeedbacks'];
  }

  String? get healthBlogs {
    return _localizedValues[locale.languageCode]!['healthBlogs'];
  }

  String? get aboutDoctohub {
    return _localizedValues[locale.languageCode]!['aboutDoctohub'];
  }

  String? get helpSupport {
    return _localizedValues[locale.languageCode]!['helpSupport'];
  }

  String? get shareApp {
    return _localizedValues[locale.languageCode]!['shareApp'];
  }

  String? get listOfFeedbacks {
    return _localizedValues[locale.languageCode]!['listOfFeedbacks'];
  }

  String? get readArticles {
    return _localizedValues[locale.languageCode]!['readArticles'];
  }

  String? get companyDetails {
    return _localizedValues[locale.languageCode]!['companyDetails'];
  }

  String? get termsPrivacy {
    return _localizedValues[locale.languageCode]!['termsPrivacy'];
  }

  String? get letUsknowQuery {
    return _localizedValues[locale.languageCode]!['letUsknowQuery'];
  }

  String? get myProfile {
    return _localizedValues[locale.languageCode]!['myProfile'];
  }

  String? get emailId {
    return _localizedValues[locale.languageCode]!['emailId'];
  }

  String? get dob {
    return _localizedValues[locale.languageCode]!['DOB'];
  }

  String? get height {
    return _localizedValues[locale.languageCode]!['height'];
  }

  String? get weight {
    return _localizedValues[locale.languageCode]!['weight'];
  }

  String? get bloodgroup {
    return _localizedValues[locale.languageCode]!['bloodgroup'];
  }

  String? get updateProfile {
    return _localizedValues[locale.languageCode]!['updateProfile'];
  }

  String? get days {
    return _localizedValues[locale.languageCode]!['days'];
  }

  String? get sixbest {
    return _localizedValues[locale.languageCode]!['sixbest'];
  }

  String? get tenPowerful {
    return _localizedValues[locale.languageCode]!['tenPowerful'];
  }

  String? get didYouKnow {
    return _localizedValues[locale.languageCode]!['didYouKnow'];
  }

  String? get dental {
    return _localizedValues[locale.languageCode]!['dental'];
  }

  String? get hairCare {
    return _localizedValues[locale.languageCode]!['hairCare'];
  }

  String? get foodnhealth {
    return _localizedValues[locale.languageCode]!['foodnhealth'];
  }

  String? get skinCare {
    return _localizedValues[locale.languageCode]!['skinCare'];
  }

  String? get letUsknowYourIssue {
    return _localizedValues[locale.languageCode]!['letUsknowYourIssue'];
  }

  String? get issueRegarding {
    return _localizedValues[locale.languageCode]!['issueRegarding'];
  }

  String? get describeYourIssue {
    return _localizedValues[locale.languageCode]!['describeYourIssue'];
  }

  String? get sendMessage {
    return _localizedValues[locale.languageCode]!['sendMessage'];
  }

  String? get preferences {
    return _localizedValues[locale.languageCode]!['preferences'];
  }

  String? get notificationSetting {
    return _localizedValues[locale.languageCode]!['notificationSetting'];
  }

  String? get appointments {
    return _localizedValues[locale.languageCode]!['appointments'];
  }

  String? get offersUpdates {
    return _localizedValues[locale.languageCode]!['offersUpdates'];
  }

  String? get general {
    return _localizedValues[locale.languageCode]!['general'];
  }

  String? get profileEdit {
    return _localizedValues[locale.languageCode]!['profileEdit'];
  }

  String? get doctoHubWebsite {
    return _localizedValues[locale.languageCode]!['doctoHubWebsite'];
  }

  String? get rateDoctohub {
    return _localizedValues[locale.languageCode]!['rateDoctohub'];
  }

  String? get areYouDoctor {
    return _localizedValues[locale.languageCode]!['areYouDoctor'];
  }

  String? get soundsAppointments {
    return _localizedValues[locale.languageCode]!['soundsAppointments'];
  }

  String? get soundChat {
    return _localizedValues[locale.languageCode]!['soundChat'];
  }

  String? get soundOffers {
    return _localizedValues[locale.languageCode]!['soundOffers'];
  }

  String? get callNow {
    return _localizedValues[locale.languageCode]!['callNow'];
  }

  String? get testsAvailable {
    return _localizedValues[locale.languageCode]!['testsAvailable'];
  }

  String? get startTime {
    return _localizedValues[locale.languageCode]!['startTime'];
  }

  String? get endTime {
    return _localizedValues[locale.languageCode]!['endTime'];
  }

  String? get thisWeek {
    return _localizedValues[locale.languageCode]!['thisWeek'];
  }

  String? get thisMonth {
    return _localizedValues[locale.languageCode]!['thisMonth'];
  }

  String? get help {
    return _localizedValues[locale.languageCode]!['help'];
  }

  String? get morning {
    return _localizedValues[locale.languageCode]!['morning'];
  }

  String? get afternoon {
    return _localizedValues[locale.languageCode]!['afternoon'];
  }

  String? get evening {
    return _localizedValues[locale.languageCode]!['evening'];
  }

  String? get night {
    return _localizedValues[locale.languageCode]!['night'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get resend {
    return _localizedValues[locale.languageCode]!['resend'];
  }

  String? get distance {
    return _localizedValues[locale.languageCode]!['distance'];
  }

  String? get viewAll {
    return _localizedValues[locale.languageCode]!['viewAll'];
  }

  String? get offers {
    return _localizedValues[locale.languageCode]!['offers'];
  }

  String? get datetime {
    return _localizedValues[locale.languageCode]!['datetime'];
  }

  String? get more {
    return _localizedValues[locale.languageCode]!['more'];
  }

  String? get register {
    return _localizedValues[locale.languageCode]!['register'];
  }

  String? get reviews {
    return _localizedValues[locale.languageCode]!['reviews'];
  }

  String? get viewMore {
    return _localizedValues[locale.languageCode]!['viewMore'];
  }

  String? get rateNow {
    return _localizedValues[locale.languageCode]!['rateNow'];
  }

  String? get readAll {
    return _localizedValues[locale.languageCode]!['readAll'];
  }

  String? get viewProfile {
    return _localizedValues[locale.languageCode]!['viewProfile'];
  }

  String? get rating {
    return _localizedValues[locale.languageCode]!['rating'];
  }

  String? get selectDateAndTime {
    return _localizedValues[locale.languageCode]!['selectDateAndTime'];
  }

  String? get profile {
    return _localizedValues[locale.languageCode]!['profile'];
  }

  String? get sun {
    return _localizedValues[locale.languageCode]!['sun'];
  }

  String? get mon {
    return _localizedValues[locale.languageCode]!['mon'];
  }

  String? get tue {
    return _localizedValues[locale.languageCode]!['tue'];
  }

  String? get wed {
    return _localizedValues[locale.languageCode]!['wed'];
  }

  String? get thr {
    return _localizedValues[locale.languageCode]!['thr'];
  }

  String? get fri {
    return _localizedValues[locale.languageCode]!['fri'];
  }

  String? get sat {
    return _localizedValues[locale.languageCode]!['sat'];
  }

  String? get lorem {
    return _localizedValues[locale.languageCode]!['lorem'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get selectLanguage {
    return _localizedValues[locale.languageCode]!['selectLanguage'];
  }

  String? get indonesia {
    return _localizedValues[locale.languageCode]!['indonesian'];
  }

  String? get italy {
    return _localizedValues[locale.languageCode]!['italian'];
  }

  String? get spansh {
    return _localizedValues[locale.languageCode]!['spanish'];
  }

  String? get arab {
    return _localizedValues[locale.languageCode]!['arabic'];
  }

  String? get frnch {
    return _localizedValues[locale.languageCode]!['french'];
  }

  String? get prtguese {
    return _localizedValues[locale.languageCode]!['portuguese'];
  }

  String? get swahilii {
    return _localizedValues[locale.languageCode]!['swahili'];
  }

  String? get eng {
    return _localizedValues[locale.languageCode]!['english'];
  }

  String? get ger {
    return _localizedValues[locale.languageCode]!['german'];
  }

  String? get turk {
    return _localizedValues[locale.languageCode]!['turkish'];
  }

  String? get headline1 {
    return _localizedValues[locale.languageCode]!['headlineFirst'];
  }

  String? get headline2 {
    return _localizedValues[locale.languageCode]!['headlineSecond'];
  }

  String? get headline3 {
    return _localizedValues[locale.languageCode]!['headlineThird'];
  }

  String? get timer1 {
    return _localizedValues[locale.languageCode]!['timer01'];
  }

  String? get timer2 {
    return _localizedValues[locale.languageCode]!['timer02'];
  }

  String? get timer3 {
    return _localizedValues[locale.languageCode]!['timer03'];
  }

  String? get timer4 {
    return _localizedValues[locale.languageCode]!['timer04'];
  }

  String? get timer5 {
    return _localizedValues[locale.languageCode]!['timer05'];
  }

  String? get timer6 {
    return _localizedValues[locale.languageCode]!['timer06'];
  }



}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'de',
        'en',
    //    'ar',
    //    'id',
    //    'pt',
    //    'fr',
    //    'es',
    //    'tr',
    //    'it',
    //    'sw'
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
