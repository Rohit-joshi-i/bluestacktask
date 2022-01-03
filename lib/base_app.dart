import 'dart:async';

import 'package:bluestacktask/app/bloc/homepage_bloc/homepage_bloc.dart';
import 'package:bluestacktask/app/bloc/login_bloc/login_provider.dart';
import 'package:bluestacktask/app/ui/homepage/homepage.dart';
import 'package:bluestacktask/common_utils/shared_prefrences_util.dart';
import 'package:bluestacktask/resources/translation/app_localization.dart';
import 'package:bluestacktask/resources/translation/translations.dart';
import 'package:bluestacktask/services/config/flavor_banner.dart';
import 'package:bluestacktask/services/navigation/locator.dart';
import 'package:bluestacktask/services/navigation/navigation_service.dart';
import 'package:bluestacktask/services/navigation/route_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/ui/login/login_page.dart';
import 'app/ui/login/model/user_model.dart';
import 'common_utils/log_util.dart';
import 'common_utils/screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void baseAppSetup() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  LoginCredentials();
  // Status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark));
  var boolLoginCheck = await SharePreferenceData().getLoggedInStatus();

  // Run the application under run zoned, to catch unhandled exceptions
  await runZonedGuarded<Future<Null>>(() async {
    LogUtil().printLog(message: 'Showing main');
    ScreenUtil.init(allowFontScaling: true);
    setupLocator();
    runApp(App(
      loggedInStatus: boolLoginCheck,
    ));
  }, (error, stackTrace) async {
    // Whenever an error occurs, call the `reportCrash` function. This will send
    // Dart errors to our dev console or Crashlytics depending on the environment.
    // await FirebaseCrashlytics.instance.recordError(error, stackTrace);
    LogUtil().printLog(
        tag: 'Main', message: 'runZonedGuarded exception: $stackTrace');
  });
}

class _AppProviders extends StatelessWidget {
  final Widget child;

  const _AppProviders({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return child;
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
      BlocProvider<HomepageBloc>(
        create: (BuildContext context) => HomepageBloc(),
      ),
    ], child: child);
  }
}

class App extends StatelessWidget {
  final bool loggedInStatus;
  App({required this.loggedInStatus});
  @override
  Widget build(BuildContext context) {
    return _AppProviders(
      child: MaterialApp(
        home: FlavorBanner(
            showBanner: kDebugMode,
            child: loggedInStatus ? HomePage() : LoginPage()),
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: [

          // A class which loads the translations
          ApplicationLocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale(Translations.kLanguageEnglish), // English, no country code
          Locale(Translations.kLanguageJapanese), // Japanese, no country code
        ],
      ),
    );
  }
}
