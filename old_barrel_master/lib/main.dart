import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:old_barrel/Auth/Login/UI/google_sign_in.dart';
import 'package:old_barrel/Auth/Registration/UI/registration_ui.dart';
import 'package:old_barrel/Theme/style.dart';
import 'package:old_barrel/map_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Auth/login_navigator.dart';
import 'Locale/locale.dart';
import 'Routes/page_routes.dart';
import 'language_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MapUtils.getMarkerPic();
  MobileAds.instance.initialize();

  final prefs = await SharedPreferences.getInstance();
  runApp(
    Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LanguageCubit()..getCurrentLanguage()),
        ],
        child: OldBarrel(),
      ),
    ),
  );
  //   MultiBlocProvider(providers: [
  //   BlocProvider(create: (context) => LanguageCubit()..getCurrentLanguage()),
  // ], child:  OldBarrel()));
}

class OldBarrel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          localizationsDelegates: [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.getSupportedLocales(),
          locale: locale,
          theme: appTheme,
          home: LoginNavigator(),
          routes: PageRoutes().routes(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
