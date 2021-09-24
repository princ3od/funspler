import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funspler/general/constants/api_path.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:funspler/general/constants/asset_constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:funspler/general/utils/responsive.dart';
import 'package:funspler/general/widgets/white_button.dart';
import 'package:funspler/modules/home/bloc/home_bloc.dart';
import 'package:funspler/modules/home/bloc/home_event.dart';
import 'package:funspler/modules/home/bloc/home_state.dart';
import 'package:funspler/modules/home/widgets/image_displayer.dart';
import 'package:funspler/modules/home/widgets/user_displayer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    print(_screenWidth);
    return BlocProvider(
      create: (_) => HomeBloc(HomeStateIntial()),
      child: WillPopScope(
        onWillPop: () async {
          if (_scrollController.position.pixels <= 10) {
            return true;
          } else {
            _scrollController.animateTo(0,
                duration: Duration(milliseconds: 1200),
                curve: Curves.fastLinearToSlowEaseIn);
            return false;
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            child: Container(
              child: Padding(
                padding: (Responsive.isMobile(context))
                    ? EdgeInsets.all(AppConstant.kDouble_16)
                    : EdgeInsets.fromLTRB(
                        (_screenWidth > 1200) ? _screenWidth / 3 : 50,
                        AppConstant.kDouble_48,
                        (_screenWidth > 1200) ? _screenWidth / 3 : 50,
                        AppConstant.kDouble_48,
                      ),
                child: Column(
                  children: [
                    SizedBox(height: AppConstant.kDouble_48),
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
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is HomeStateFetching ||
                            state is HomeStateFinished) {
                          return ImageDisplayer(
                            seed: state.mainImageSeed,
                            height: (Responsive.isMobile(context) ||
                                    (_screenWidth < 1200))
                                ? _screenWidth - AppConstant.kDouble_16 * 2
                                : _screenWidth.toInt() / 4,
                            width: (Responsive.isMobile(context) ||
                                    (_screenWidth < 1200))
                                ? _screenWidth - AppConstant.kDouble_16 * 2
                                : _screenWidth.toInt() / 4,
                            path: ApiPath.squareImage(
                                seed: state.mainImageSeed,
                                width: (Responsive.isMobile(context))
                                    ? _screenWidth.toInt() -
                                        AppConstant.kDouble_16.toInt() * 2
                                    : _screenWidth.toInt() ~/ 4),
                            onTap: () {
                              if (state is HomeStateIntial) {
                                return;
                              }
                              String path = ApiPath.squareImage(
                                  seed: state.mainImageSeed,
                                  width: ((_screenWidth.toInt() -
                                              AppConstant.kDouble_16.toInt() *
                                                  2) *
                                          1.5)
                                      .toInt());
                              context.read<HomeBloc>().add(
                                  HomeEventViewFullScreen(state.mainImageSeed,
                                      context: context,
                                      isMain: true,
                                      path: path));
                            },
                          );
                        }
                        context.read<HomeBloc>().add(HomeEventFirstFetch());
                        return Image.asset(
                          AssetConstant.shimmer,
                          height: _screenWidth - AppConstant.kDouble_16 * 2,
                          width: _screenWidth - AppConstant.kDouble_16 * 2,
                        );
                      },
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
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) => Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: (state is HomeStateIntial)
                                    ? 0
                                    : state.imageCount ~/ 2,
                                itemBuilder: (context, i) {
                                  return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: AppConstant.kDouble_10),
                                      child: ImageDisplayer(
                                        height: _getHeightLeft(
                                            i, (Responsive.isMobile(context))),
                                        width: _getWidth(_screenWidth,
                                            (Responsive.isMobile(context))),
                                        path: ApiPath.verticalImage(
                                            seed: state.imageSeeds[i * 2],
                                            height: _getHeightLeft(
                                                    i,
                                                    (Responsive.isMobile(
                                                        context)))
                                                .toInt(),
                                            width: _getWidth(
                                                    _screenWidth,
                                                    (Responsive.isMobile(
                                                        context)))
                                                .toInt()),
                                        seed: state.imageSeeds[i * 2],
                                        onTap: () {
                                          String path = ApiPath.verticalImage(
                                            seed: state.imageSeeds[i * 2],
                                            height: (_getHeightRight(
                                                            i,
                                                            (Responsive
                                                                .isMobile(
                                                                    context)))
                                                        .toInt() *
                                                    2.5)
                                                .toInt(),
                                            width: (_getWidth(
                                                        _screenWidth,
                                                        (Responsive.isMobile(
                                                            context))) *
                                                    2)
                                                .toInt(),
                                          );
                                          print(
                                              'open ${state.imageSeeds[i * 2]}');
                                          context.read<HomeBloc>().add(
                                              HomeEventViewFullScreen(
                                                  state.imageSeeds[i * 2],
                                                  context: context,
                                                  isMain: false,
                                                  path: path));
                                        },
                                      ));
                                },
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
                                itemCount: (state is HomeStateIntial)
                                    ? 0
                                    : state.imageCount ~/ 2,
                                itemBuilder: (context, i) {
                                  return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: AppConstant.kDouble_10),
                                      child: ImageDisplayer(
                                        height: _getHeightRight(
                                            i, (Responsive.isMobile(context))),
                                        width: _getWidth(_screenWidth,
                                            (Responsive.isMobile(context))),
                                        path: ApiPath.verticalImage(
                                            seed: state.imageSeeds[i * 2 + 1],
                                            height: _getHeightRight(
                                                    i,
                                                    (Responsive.isMobile(
                                                        context)))
                                                .toInt(),
                                            width: _getWidth(
                                                    _screenWidth,
                                                    (Responsive.isMobile(
                                                        context)))
                                                .toInt()),
                                        seed: state.imageSeeds[i * 2 + 1],
                                        onTap: () {
                                          String path = ApiPath.verticalImage(
                                            seed: state.imageSeeds[i * 2 + 1],
                                            height: (_getHeightRight(
                                                            i,
                                                            (Responsive
                                                                .isMobile(
                                                                    context)))
                                                        .toInt() *
                                                    2.5)
                                                .toInt(),
                                            width: (_getWidth(
                                                        _screenWidth,
                                                        (Responsive.isMobile(
                                                            context))) *
                                                    2)
                                                .toInt(),
                                          );
                                          print(
                                              'open ${state.imageSeeds[i * 2 + 1]}');
                                          context.read<HomeBloc>().add(
                                              HomeEventViewFullScreen(
                                                  state.imageSeeds[i * 2 + 1],
                                                  context: context,
                                                  isMain: false,
                                                  path: path));
                                        },
                                      ));
                                },
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) => WhiteButton(
                          text: AppLocalizations.of(context)!.seeMore,
                          onPressed: () {
                            context.read<HomeBloc>().add(HomeEventFetchMore());
                          },
                          isLoading: (state is HomeStateFetching),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getHeightRight(int i, bool isMobile) {
    if (isMobile) return ((i % 5) % 2 == 1 || (i % 5) < 2) ? 310 : 220;
    return ((i % 5) % 2 == 1 || (i % 5) < 2) ? 620 : 440;
  }

  double _getWidth(double _screenWidth, bool isMobile) {
    if (isMobile) {
      return _screenWidth.toInt() ~/ 2 - AppConstant.kDouble_16;
    } else {
      var w = _screenWidth.toInt() ~/ 4 - AppConstant.kDouble_16;
      if (w < 250) return 250;
      return w;
    }
  }

  double _getHeightLeft(int i, bool isMobile) {
    if (isMobile) return ((i % 5) % 2 == 0 && (i % 5) < 3) ? 220 : 310;
    return ((i % 5) % 2 == 0 && (i % 5) < 3) ? 440 : 620;
  }
}
