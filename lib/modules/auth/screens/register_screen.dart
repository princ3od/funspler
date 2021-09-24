import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:funspler/general/constants/asset_constant.dart';
import 'package:funspler/general/theme/widget_theme.dart';
import 'package:funspler/general/utils/responsive.dart';
import 'package:funspler/general/widgets/black_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Container(),
      mobile: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Image.asset(
              AssetConstant.backArrow,
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(AppConstant.kDouble_16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.register,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstant.kDouble_32),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: defaultTextfieldDecoration(
                        hint: AppLocalizations.of(context)!.userName),
                  ),
                  SizedBox(height: AppConstant.kDouble_16),
                  TextField(
                    cursorColor: Colors.black,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: defaultTextfieldDecoration(
                        hint: AppLocalizations.of(context)!.password),
                  ),
                  SizedBox(height: AppConstant.kDouble_16),
                  TextField(
                    cursorColor: Colors.black,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: defaultTextfieldDecoration(
                        hint: AppLocalizations.of(context)!.confirmPassword),
                  ),
                  SizedBox(height: AppConstant.kDouble_16),
                  SizedBox(
                    width: double.infinity,
                    child: BlackButton(
                      text: AppLocalizations.of(context)!.signUp.toUpperCase(),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: AppConstant.kDouble_32),
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                        TextSpan(
                            text:
                                '${AppLocalizations.of(context)!.conditionArgee} '),
                        TextSpan(
                          text: AppLocalizations.of(context)!.termsOfServices,
                          style: GoogleFonts.roboto(
                              decoration: TextDecoration.underline,
                              fontSize: AppConstant.kDouble_13,
                              color: Colors.black),
                        ),
                        TextSpan(
                            text: ' ${AppLocalizations.of(context)!.and} '),
                        TextSpan(
                          text: AppLocalizations.of(context)!.privacyPolicy,
                          style: GoogleFonts.roboto(
                              decoration: TextDecoration.underline,
                              fontSize: AppConstant.kDouble_13,
                              color: Colors.black),
                        ),
                        if (AppLocalizations.of(context)!.localeName == 'vi')
                          TextSpan(
                              text:
                                  ' ${AppLocalizations.of(context)!.conditionArgeeVN}'),
                        TextSpan(text: '.'),
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
