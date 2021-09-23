import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:funspler/general/constants/asset_constant.dart';
import 'package:funspler/general/core/routes/routes.dart';
import 'package:funspler/general/theme/widget_theme.dart';
import 'package:funspler/general/widgets/black_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(AppConstant.kDouble_16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login,
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
                SizedBox(
                  width: double.infinity,
                  child: BlackButton(
                    text: AppLocalizations.of(context)!.login.toUpperCase(),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.home);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
