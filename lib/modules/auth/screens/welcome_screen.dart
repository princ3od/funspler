import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:funspler/general/constants/asset_constant.dart';
import 'package:funspler/general/constants/string.dart';
import 'package:funspler/general/core/routes/routes.dart';
import 'package:funspler/general/theme/theme_provider.dart';
import 'package:funspler/general/theme/widget_theme.dart';
import 'package:funspler/general/utils/responsive.dart';
import 'package:funspler/general/widgets/black_button.dart';
import 'package:funspler/general/widgets/white_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _screenHeight = MediaQuery.of(context).size.height;
    final _theme = Provider.of<ThemeProvider>(context);
    return Responsive(
      mobile: Stack(
        children: [
          Image.asset(
            AssetConstant.welcomeBg,
            width: _screenWidth,
            height: _screenHeight,
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetConstant.logo,
                        width: AppConstant.kDouble_40,
                        height: AppConstant.kDouble_40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: AppConstant.kDouble_20),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          AppString.appName,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WhiteButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.login);
                                },
                                text: AppLocalizations.of(context)!
                                    .login
                                    .toUpperCase()),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BlackButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.register);
                                },
                                text: AppLocalizations.of(context)!
                                    .register
                                    .toUpperCase(),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      desktop: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                ),
              ),
              child: Image.asset(
                AssetConstant.welcomeBg,
                width: 600,
                height: _screenHeight / 1.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetConstant.logo,
                        width: AppConstant.kDouble_40,
                        height: AppConstant.kDouble_40,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: AppConstant.kDouble_20),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          AppString.appName,
                          style: GoogleFonts.comfortaa(
                            fontSize: AppConstant.kDouble_48,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstant.kDouble_16),
                  Container(
                    color: Colors.white,
                    width: 250,
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: defaultTextfieldDecoration(
                          hint: AppLocalizations.of(context)!.userName),
                    ),
                  ),
                  SizedBox(height: AppConstant.kDouble_16),
                  Container(
                    color: Colors.white,
                    width: 250,
                    child: TextField(
                      cursorColor: Colors.black,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: defaultTextfieldDecoration(
                          hint: AppLocalizations.of(context)!.password),
                    ),
                  ),
                  SizedBox(height: AppConstant.kDouble_16),
                  Padding(
                    padding: const EdgeInsets.all(AppConstant.kDouble_8),
                    child: SizedBox(
                      width: 250,
                      child: WhiteButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.login);
                          },
                          text: AppLocalizations.of(context)!
                              .login
                              .toUpperCase()),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 110,
                        child: Divider(
                          thickness: 1.5,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        ' OR ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: 110,
                        child: Divider(
                          thickness: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(AppConstant.kDouble_8),
                      child: SizedBox(
                        width: 250,
                        child: BlackButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.register);
                          },
                          text: AppLocalizations.of(context)!
                              .register
                              .toUpperCase(),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
