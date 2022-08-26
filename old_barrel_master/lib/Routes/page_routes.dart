import 'package:flutter/material.dart';
import 'package:old_barrel/BottomNavigation/Account/add_address.dart';
import 'package:old_barrel/BottomNavigation/Account/add_card.dart';
import 'package:old_barrel/BottomNavigation/Account/choose_language.dart';
import 'package:old_barrel/BottomNavigation/Account/faq_page.dart';
import 'package:old_barrel/BottomNavigation/Account/favourites_page.dart';
import 'package:old_barrel/BottomNavigation/Account/manage_addresses.dart';
import 'package:old_barrel/BottomNavigation/Account/my_profile.dart';
import 'package:old_barrel/BottomNavigation/Account/privacy_policy.dart';
import 'package:old_barrel/BottomNavigation/Account/saved_cards.dart';
import 'package:old_barrel/BottomNavigation/Account/support_page.dart';
import 'package:old_barrel/BottomNavigation/Home/product_list_page.dart';
import 'package:old_barrel/BottomNavigation/Home/home_page.dart';
import 'package:old_barrel/BottomNavigation/Home/item_info.dart';
import 'package:old_barrel/BottomNavigation/Home/search_page.dart';
import 'package:old_barrel/BottomNavigation/MyOrders/order_detail.dart';
import 'package:old_barrel/BottomNavigation/bottom_navigation.dart';
import 'package:old_barrel/Checkout/cart_page.dart';
import 'package:old_barrel/Checkout/payment_done.dart';
import 'package:old_barrel/Checkout/payment_page.dart';

class PageRoutes {
  static const String homePage = 'home_page';
  static const String bottomNavigation = 'bottom_navigation';
  static const String searchPage = 'search_page';
  static const String beerPage = 'beer_page';
  static const String itemInfoPage = 'item_info';
  static const String cartPage = 'cart_page';
  static const String paymentPage = 'payment_page';
  static const String paymentDonePage = 'order_placed_page';
  static const String orderDetailPage = 'order_detail';
  static const String myProfilePage = 'my_profile';
  static const String favouritesPage = 'favourite_page';
  static const String manageAddressPage = 'manage_addresses';
  static const String addNewAddress = 'add_new_address';
  static const String savedCardsPage = 'saved_cards';
  static const String addCardPage = 'add_card';
  static const String supportPage = 'support_page';
  static const String privacyPolicy = 'privacy_policy';
  static const String chooseLanguagePage = 'choose_language';
  static const String faqPage = 'faq_page';

  Map<String, WidgetBuilder> routes() {
    return {
      homePage: (context) => HomePage(),
      bottomNavigation: (context) => AppNavigation(),
      searchPage: (context) => SearchPage(),
      beerPage: (context) => BeerPage(),
      itemInfoPage: (context) => ItemInfoPage(),
      cartPage: (context) => CartPage(),
      paymentPage: (context) => PaymentPage(),
      paymentDonePage: (context) => PaymentDonePage(),
      orderDetailPage: (context) => OrderDetail(),
      myProfilePage: (context) => MyProfile(),
      favouritesPage: (context) => FavouritesPage(),
      manageAddressPage: (context) => ManageAddressPage(),
      addNewAddress: (context) => AddAddressPage(),
      savedCardsPage: (context) => SavedCards(),
      addCardPage: (context) => AddCardPage(),
      supportPage: (context) => SupportPage(),
      privacyPolicy: (context) => PrivacyPolicy(),
      chooseLanguagePage: (context) => ChooseLanguage(),
      faqPage: (context) => FaqPage(),
    };
  }
}
