import 'package:flutter/material.dart';
import 'package:funspler/general/core/routes/routes.dart';
import 'package:funspler/general/theme/theme_provider.dart';
import 'package:funspler/modules/auth/screens/welcome_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'general/constants/app_constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funspler',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: Routes.appRoutes,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.comfortaa(
              fontSize: AppConstant.kDouble_48, color: Colors.black),
          headline2: GoogleFonts.comfortaa(
              fontSize: AppConstant.kDouble_36, color: Colors.black),
          headline3: GoogleFonts.roboto(
              fontSize: AppConstant.kDouble_15,
              color: Colors.black,
              fontWeight: FontWeight.w900),
          bodyText1: GoogleFonts.roboto(
              fontSize: AppConstant.kDouble_15,
              color: Colors.black,
              fontWeight: FontWeight.w400),
          bodyText2: GoogleFonts.roboto(
              fontSize: AppConstant.kDouble_15, color: Colors.black),
          caption: GoogleFonts.roboto(
              fontSize: AppConstant.kDouble_13,
              color: Colors.black,
              fontWeight: FontWeight.w700),
          subtitle1: GoogleFonts.roboto(
              fontSize: AppConstant.kDouble_15,
              color: Colors.black,
              fontWeight: FontWeight.w400),
          subtitle2: GoogleFonts.roboto(
              fontSize: AppConstant.kDouble_11,
              color: Colors.black,
              fontWeight: FontWeight.w400),
        ),
      ),
      home: ChangeNotifierProvider(
          create: (context) => ThemeProvider(isLightTheme: true),
          child: WelcomeScreen()),
    );
  }
}
