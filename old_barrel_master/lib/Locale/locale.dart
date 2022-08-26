import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:old_barrel/Config/app_config.dart';
import 'package:old_barrel/Locale/Languages/german.dart';
import 'package:old_barrel/Locale/Languages/italian.dart';
import 'package:old_barrel/Locale/Languages/romanian.dart';
import 'package:old_barrel/Locale/Languages/swahili.dart';
import 'package:old_barrel/Locale/Languages/turkish.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

   static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'it': italian(),
    'tr': turkish(),
    'sw': swahili(),
    "de": german(),
    "ro": romanian(),
  };

  String? get signInNow {
    return _localizedValues[locale.languageCode]!['signInNow'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get enterPhoneNumber {
    return _localizedValues[locale.languageCode]!['enterPhoneNumber'];
  }

  String? get orContinueWith {
    return _localizedValues[locale.languageCode]!['orContinueWith'];
  }

  String? get facebook {
    return _localizedValues[locale.languageCode]!['facebook'];
  }

  String? get google {
    return _localizedValues[locale.languageCode]!['google'];
  }

  String? get register {
    return _localizedValues[locale.languageCode]!['register'];
  }

  String? get inLessThanAMinute {
    return _localizedValues[locale.languageCode]!['inLessThanAMinute'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get enterFullName {
    return _localizedValues[locale.languageCode]!['enterFullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get enterEmailAddress {
    return _localizedValues[locale.languageCode]!['enterEmailAddress'];
  }

  String? get wellSendVerificationCode {
    return _localizedValues[locale.languageCode]!['wellSendVerificationCode'];
  }

  String? get verification {
    return _localizedValues[locale.languageCode]!['verification'];
  }

  String? get weveSentVerificationCode {
    return _localizedValues[locale.languageCode]!['weveSentVerificationCode'];
  }

  String? get enterCode {
    return _localizedValues[locale.languageCode]!['enterCode'];
  }

  String? get enter6DigitCode {
    return _localizedValues[locale.languageCode]!['enter6DigitCode'];
  }

  String? get getStarted {
    return _localizedValues[locale.languageCode]!['getStarted'];
  }

  String? get favorites {
    return _localizedValues[locale.languageCode]!['favorites'];
  }

  String? get yourSavedLiquors {
    return _localizedValues[locale.languageCode]!['yourSavedLiquors'];
  }

  String? get manageAddress {
    return _localizedValues[locale.languageCode]!['manageAddress'];
  }

  String? get preSavedAddresses {
    return _localizedValues[locale.languageCode]!['preSavedAddresses'];
  }

  String? get savedCards {
    return _localizedValues[locale.languageCode]!['savedCards'];
  }

  String? get preSavedCardFor {
    return _localizedValues[locale.languageCode]!['preSavedCardFor'];
  }

  String? get support {
    return _localizedValues[locale.languageCode]!['support'];
  }

  String? get connectUsForIssueFeedback {
    return _localizedValues[locale.languageCode]!['connectUsForIssueFeedback'];
  }

  String? get privacyPolicy {
    return _localizedValues[locale.languageCode]!['privacyPolicy'];
  }

  String? get knowOurPrivacyPolicies {
    return _localizedValues[locale.languageCode]!['knowOurPrivacyPolicies'];
  }

  String? get changeLanguage {
    return _localizedValues[locale.languageCode]!['changeLanguage'];
  }

  String? get chooseYourLang {
    return _localizedValues[locale.languageCode]!['chooseYourLang'];
  }

  String? get faqs {
    return _localizedValues[locale.languageCode]!['faqs'];
  }

  String? get freqAskedQues {
    return _localizedValues[locale.languageCode]!['freqAskedQues'];
  }

  String? get searchService {
    return _localizedValues[locale.languageCode]!['searchService'];
  }

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get office {
    return _localizedValues[locale.languageCode]!['office'];
  }

  String? get other {
    return _localizedValues[locale.languageCode]!['other'];
  }

  String? get addLandmark {
    return _localizedValues[locale.languageCode]!['addLandmark'];
  }

  String? get writeAddressLandmark {
    return _localizedValues[locale.languageCode]!['writeAddressLandmark'];
  }

  String? get saveAddress {
    return _localizedValues[locale.languageCode]!['saveAddress'];
  }

  String? get addCard {
    return _localizedValues[locale.languageCode]!['addCard'];
  }

  String? get cardNumber {
    return _localizedValues[locale.languageCode]!['cardNumber'];
  }

  String? get nameOnCard {
    return _localizedValues[locale.languageCode]!['nameOnCard'];
  }

  String? get enterCardHolderName {
    return _localizedValues[locale.languageCode]!['enterCardHolderName'];
  }

  String? get expiryMonth {
    return _localizedValues[locale.languageCode]!['expiryMonth'];
  }

  String? get expiryYear {
    return _localizedValues[locale.languageCode]!['expiryYear'];
  }

  String? get saveCard {
    return _localizedValues[locale.languageCode]!['saveCard'];
  }

  String? get englishh {
    return _localizedValues[locale.languageCode]!['englishh'];
  }

  String? get arabicc {
    return _localizedValues[locale.languageCode]!['arabicc'];
  }

  String? get frenchh {
    return _localizedValues[locale.languageCode]!['frenchh'];
  }

  String? get indonesiann {
    return _localizedValues[locale.languageCode]!['indonesiann'];
  }

  String? get spanishh {
    return _localizedValues[locale.languageCode]!['spanishh'];
  }

  String? get portuguesee {
    return _localizedValues[locale.languageCode]!['portuguesee'];
  }

  String? get language {
    return _localizedValues[locale.languageCode]!['language'];
  }

  String? get preferredLang {
    return _localizedValues[locale.languageCode]!['preferredLang'];
  }

  String? get selectPrefLang {
    return _localizedValues[locale.languageCode]!['selectPrefLang'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get faq1 {
    return _localizedValues[locale.languageCode]!['faq1'];
  }

  String? get faq2 {
    return _localizedValues[locale.languageCode]!['faq2'];
  }

  String? get faq3 {
    return _localizedValues[locale.languageCode]!['faq3'];
  }

  String? get faq4 {
    return _localizedValues[locale.languageCode]!['faq4'];
  }

  String? get faq5 {
    return _localizedValues[locale.languageCode]!['faq5'];
  }

  String? get faq6 {
    return _localizedValues[locale.languageCode]!['faq6'];
  }

  String? get fAQs {
    return _localizedValues[locale.languageCode]!['fAQs'];
  }

  String? get getYourAnswers {
    return _localizedValues[locale.languageCode]!['getYourAnswers'];
  }

  String? get addNewAddress {
    return _localizedValues[locale.languageCode]!['addNewAddress'];
  }

  String? get myProfile {
    return _localizedValues[locale.languageCode]!['myProfile'];
  }

  String? get everythingAboutYou {
    return _localizedValues[locale.languageCode]!['everythingAboutYou'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get howWeWork {
    return _localizedValues[locale.languageCode]!['howWeWork'];
  }

  String? get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'];
  }

  String? get addNewCard {
    return _localizedValues[locale.languageCode]!['addNewCard'];
  }

  String? get cardHolderName {
    return _localizedValues[locale.languageCode]!['cardHolderName'];
  }

  String? get validThru {
    return _localizedValues[locale.languageCode]!['validThru'];
  }

  String? get connectUs {
    return _localizedValues[locale.languageCode]!['connectUs'];
  }

  String? get callUs {
    return _localizedValues[locale.languageCode]!['callUs'];
  }

  String? get mailUs {
    return _localizedValues[locale.languageCode]!['mailUs'];
  }

  String? get writeUs {
    return _localizedValues[locale.languageCode]!['writeUs'];
  }

  String? get letUsKnowYourQuery {
    return _localizedValues[locale.languageCode]!['letUsKnowYourQuery'];
  }

  String? get phoneNumEmail {
    return _localizedValues[locale.languageCode]!['phoneNumEmail'];
  }

  String? get addContactInfo {
    return _localizedValues[locale.languageCode]!['addContactInfo'];
  }

  String? get addYourIssueFeedback {
    return _localizedValues[locale.languageCode]!['addYourIssueFeedback'];
  }

  String? get writeYourMsg {
    return _localizedValues[locale.languageCode]!['writeYourMsg'];
  }

  String? get beer {
    return _localizedValues[locale.languageCode]!['beer'];
  }

  String? get wine {
    return _localizedValues[locale.languageCode]!['wine'];
  }

  String? get vodka {
    return _localizedValues[locale.languageCode]!['vodka'];
  }

  String? get brandy {
    return _localizedValues[locale.languageCode]!['brandy'];
  }

  String? get rum {
    return _localizedValues[locale.languageCode]!['rum'];
  }

  String? get tequila {
    return _localizedValues[locale.languageCode]!['tequila'];
  }

  String? get whiskey {
    return _localizedValues[locale.languageCode]!['whiskey'];
  }

  String? get more {
    return _localizedValues[locale.languageCode]!['more'];
  }

  String? get deliveryTo {
    return _localizedValues[locale.languageCode]!['deliveryTo'];
  }

  String? get categories {
    return _localizedValues[locale.languageCode]!['categories'];
  }

  String? get selectVolume {
    return _localizedValues[locale.languageCode]!['selectVolume'];
  }

  String? get stay {
    return _localizedValues[locale.languageCode]!['stay'];
  }

  String? get stable {
    return _localizedValues[locale.languageCode]!['stable'];
  }

  String? get gett {
    return _localizedValues[locale.languageCode]!['gett'];
  }

  String? get drunk {
    return _localizedValues[locale.languageCode]!['drunk'];
  }

  String? get bottles {
    return _localizedValues[locale.languageCode]!['bottles'];
  }

  String? get addToBag {
    return _localizedValues[locale.languageCode]!['addToBag'];
  }

  String? get newest {
    return _localizedValues[locale.languageCode]!['newest'];
  }

  String? get priceHighToLow {
    return _localizedValues[locale.languageCode]!['priceHighToLow'];
  }

  String? get priceLowToHigh {
    return _localizedValues[locale.languageCode]!['priceLowToHigh'];
  }

  String? get nameAZ {
    return _localizedValues[locale.languageCode]!['nameAZ'];
  }

  String? get nameZA {
    return _localizedValues[locale.languageCode]!['nameZA'];
  }

  String? get sortNFilter {
    return _localizedValues[locale.languageCode]!['sortNFilter'];
  }

  String? get reset {
    return _localizedValues[locale.languageCode]!['reset'];
  }

  String? get sortBy {
    return _localizedValues[locale.languageCode]!['sortBy'];
  }

  String? get priceRange {
    return _localizedValues[locale.languageCode]!['priceRange'];
  }

  String? get brand {
    return _localizedValues[locale.languageCode]!['brand'];
  }

  String? get apply {
    return _localizedValues[locale.languageCode]!['apply'];
  }

  String? get all {
    return _localizedValues[locale.languageCode]!['all'];
  }

  String? get imported {
    return _localizedValues[locale.languageCode]!['imported'];
  }

  String? get crafted {
    return _localizedValues[locale.languageCode]!['crafted'];
  }

  String? get local {
    return _localizedValues[locale.languageCode]!['local'];
  }

  String? get recentSearches {
    return _localizedValues[locale.languageCode]!['recentSearches'];
  }

  String? get lightBeer {
    return _localizedValues[locale.languageCode]!['lightBeer'];
  }

  String? get myOrders {
    return _localizedValues[locale.languageCode]!['myOrders'];
  }

  String? get orderInProcess {
    return _localizedValues[locale.languageCode]!['orderInProcess'];
  }

  String? get order {
    return _localizedValues[locale.languageCode]!['order'];
  }

  String? get confirmed {
    return _localizedValues[locale.languageCode]!['confirmed'];
  }

  String? get cod {
    return _localizedValues[locale.languageCode]!['cod'];
  }

  String? get pastOrders {
    return _localizedValues[locale.languageCode]!['pastOrders'];
  }

  String? get delivered {
    return _localizedValues[locale.languageCode]!['delivered'];
  }

  String? get orderPlaced {
    return _localizedValues[locale.languageCode]!['orderPlaced'];
  }

  String? get orderConfirmed {
    return _localizedValues[locale.languageCode]!['orderConfirmed'];
  }

  String? get outForDelivery {
    return _localizedValues[locale.languageCode]!['outForDelivery'];
  }

  String? get usuallyConfirmedIn {
    return _localizedValues[locale.languageCode]!['usuallyConfirmedIn'];
  }

  String? get willNotifyWhen {
    return _localizedValues[locale.languageCode]!['willNotifyWhen'];
  }

  String? get expectedDeliveryIn {
    return _localizedValues[locale.languageCode]!['expectedDeliveryIn'];
  }

  String? get orderDetail {
    return _localizedValues[locale.languageCode]!['orderDetail'];
  }

  String? get cashOnDelivery {
    return _localizedValues[locale.languageCode]!['cashOnDelivery'];
  }

  String? get paymentMode {
    return _localizedValues[locale.languageCode]!['paymentMode'];
  }

  String? get deliveryAt {
    return _localizedValues[locale.languageCode]!['deliveryAt'];
  }

  String? get orderStatus {
    return _localizedValues[locale.languageCode]!['orderStatus'];
  }

  String? get viewOrder {
    return _localizedValues[locale.languageCode]!['viewOrder'];
  }

  String? get subTotal {
    return _localizedValues[locale.languageCode]!['subTotal'];
  }

  String? get deliveryCharges {
    return _localizedValues[locale.languageCode]!['deliveryCharges'];
  }

  String? get toPay {
    return _localizedValues[locale.languageCode]!['toPay'];
  }

  String? get account {
    return _localizedValues[locale.languageCode]!['account'];
  }

  String? get myBag {
    return _localizedValues[locale.languageCode]!['myBag'];
  }

  String? get itemsInBag {
    return _localizedValues[locale.languageCode]!['itemsInBag'];
  }

  String? get haveAPromoCode {
    return _localizedValues[locale.languageCode]!['haveAPromoCode'];
  }

  String? get pay {
    return _localizedValues[locale.languageCode]!['pay'];
  }

  String? get cheers {
    return _localizedValues[locale.languageCode]!['cheers'];
  }

  String? get yourOrderHasBeenPlaced {
    return _localizedValues[locale.languageCode]!['yourOrderHasBeenPlaced'];
  }

  String? get payment {
    return _localizedValues[locale.languageCode]!['payment'];
  }

  String? get amountToPay {
    return _localizedValues[locale.languageCode]!['amountToPay'];
  }

  String? get selectPaymentMethod {
    return _localizedValues[locale.languageCode]!['selectPaymentMethod'];
  }

  String? get paymentGateway {
    return _localizedValues[locale.languageCode]!['paymentGateway'];
  }

  String? get brands {
    return _localizedValues[locale.languageCode]!['brands'];
  }

  String? get continuee {
    return _localizedValues[locale.languageCode]!['continuee'];
  }

  String? get searchYourPoison {
    return _localizedValues[locale.languageCode]!['searchYourPoison'];
  }

  static List<Locale> getSupportedLocales() {
    List<Locale> toReturn = [];
    for (String langCode in AppConfig.languagesSupported.keys) {
      toReturn.add(Locale(langCode));
    }
    return toReturn;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
        'fr',
        'in',
        'pt',
        'es',
        'it',
        'tr',
        'sw',
        "de",
        "ro",
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
