import 'package:flutter/cupertino.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class HomeEventFirstFetch extends HomeEvent {}

class HomeEventFetchMore extends HomeEvent {}

class HomeEventViewFullScreen extends HomeEvent {
  final bool isMain;
  final String path;
  final int seed;
  BuildContext context;
  HomeEventViewFullScreen(this.seed,
      {required this.context, required this.isMain, required this.path});
}
