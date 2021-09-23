import 'package:flutter/material.dart';
import 'package:funspler/general/constants/api_path.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:funspler/general/constants/asset_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:funspler/general/widgets/white_button.dart';
import 'package:funspler/modules/home/widgets/user_displayer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(AppConstant.kDouble_16),
            child: Column(
              children: [
                SizedBox(height: AppConstant.kDouble_40 * 2),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.discover,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                SizedBox(height: AppConstant.kDouble_32),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.whatNew.toUpperCase(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                SizedBox(height: AppConstant.kDouble_32),
                FadeInImage.assetNetwork(
                  placeholder: AssetConstant.shimmer,
                  image: ApiPath.squareImage(
                      width: _screenWidth.toInt() -
                          AppConstant.kDouble_16.toInt() * 2),
                  height: _screenWidth - AppConstant.kDouble_16 * 2,
                  width: _screenWidth - AppConstant.kDouble_16 * 2,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: AppConstant.kDouble_10),
                UserDisplayer(),
                SizedBox(height: AppConstant.kDouble_48),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.browseAll.toUpperCase(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
                SizedBox(height: AppConstant.kDouble_24),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, i) => Padding(
                            padding:
                                EdgeInsets.only(bottom: AppConstant.kDouble_10),
                            child: FadeInImage.assetNetwork(
                              placeholder: AssetConstant.shimmer,
                              image: ApiPath.verticalImage(
                                  height:
                                      ((i % 2 == 0 && i < 3) ? 220 : 310) + i,
                                  width: _screenWidth.toInt() ~/ 2 -
                                      AppConstant.kDouble_16.toInt()),
                              height: (i % 2 == 0 && i < 3) ? 220 : 310,
                              width: _screenWidth.toInt() ~/ 2 -
                                  AppConstant.kDouble_16,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(width: AppConstant.kDouble_10),
                    Expanded(
                        child: Column(
                      children: [
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, i) => Padding(
                            padding:
                                EdgeInsets.only(bottom: AppConstant.kDouble_10),
                            child: FadeInImage.assetNetwork(
                              placeholder: AssetConstant.shimmer,
                              image: ApiPath.verticalImage(
                                  height: ((i % 2 == 1 || i < 2) ? 310 : 220) +
                                      i * 2,
                                  width: _screenWidth.toInt() ~/ 2 -
                                      AppConstant.kDouble_16.toInt()),
                              height: (i % 2 == 1 || i < 2) ? 310 : 220,
                              width: _screenWidth.toInt() ~/ 2 -
                                  AppConstant.kDouble_16,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: WhiteButton(
                    text: AppLocalizations.of(context)!.seeMore,
                    onPressed: () {},
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
