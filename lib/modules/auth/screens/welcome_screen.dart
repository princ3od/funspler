import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:funspler/general/constants/asset_constant.dart';
import 'package:funspler/general/constants/string.dart';
import 'package:funspler/general/core/routes/routes.dart';
import 'package:funspler/general/utils/responsive.dart';
import 'package:funspler/general/widgets/black_button.dart';
import 'package:funspler/general/widgets/white_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _screenHeight = MediaQuery.of(context).size.height;
    return Responsive(
      mobile: Stack(
        children: [
          Image.asset(
            AssetConstant.welcome_bg,
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
                          style: GoogleFonts.comfortaa(
                            fontSize: AppConstant.kDouble_48,
                          ),
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
                                  Navigator.pushNamed(context, Routes.welcome);
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
                                onPressed: () {},
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
          Image.asset(
            AssetConstant.welcome_bg,
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
                          style: GoogleFonts.comfortaa(
                            fontSize: AppConstant.kDouble_48,
                          ),
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
                            padding:
                                const EdgeInsets.all(AppConstant.kDouble_8),
                            child: WhiteButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.welcome);
                                },
                                text: AppLocalizations.of(context)!
                                    .login
                                    .toUpperCase()),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.all(AppConstant.kDouble_8),
                              child: BlackButton(
                                onPressed: () {},
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
    );
  }
}
