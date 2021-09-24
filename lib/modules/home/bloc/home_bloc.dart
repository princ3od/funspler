import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funspler/modules/home/bloc/home_event.dart';
import 'package:funspler/modules/home/bloc/home_state.dart';
import 'package:funspler/modules/home/screens/full_image_screen.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late HomeState _currentSate;
  HomeBloc(HomeState initialState) : super(initialState) {
    _currentSate = initialState;
    on<HomeEventFirstFetch>(_onFirstFetched);
    on<HomeEventViewFullScreen>(_onView);
    on<HomeEventFetchMore>(_onFetchMore);
  }
  FutureOr<void> _onFirstFetched(
      HomeEvent event, Emitter<HomeState> emit) async {
    var seed = Random().nextInt(10000);
    print(seed);
    var state = HomeStateFinished();
    state.mainImageSeed = seed;
    state.imageCount = 10;
    for (var i = 0; i < state.imageCount; i++) {
      seed = Random().nextInt(100000);
      state.imageSeeds.add(seed);
    }
    await Future.delayed(Duration(seconds: 1));
    _currentSate = state;
    emit(state);
    return null;
  }

  FutureOr<void> _onView(
      HomeEventViewFullScreen event, Emitter<HomeState> emit) async {
    Navigator.push(
        event.context,
        MaterialPageRoute(
            builder: (c) => FullImageScreen(
                  imageURL: event.path,
                  tag: '${event.seed}',
                )));
    return null;
  }

  FutureOr<void> _onFetchMore(
      HomeEventFetchMore event, Emitter<HomeState> emit) async {
    var fetchingState = HomeStateFetching();
    fetchingState.mainImageSeed = _currentSate.mainImageSeed;
    fetchingState.imageCount = _currentSate.imageCount;
    fetchingState.imageSeeds = _currentSate.imageSeeds;
    emit(fetchingState);
    await Future.delayed(Duration(milliseconds: 750));
    var state = HomeStateFinished();
    state.mainImageSeed = _currentSate.mainImageSeed;
    state.imageCount = _currentSate.imageCount + 10;
    state.imageSeeds = _currentSate.imageSeeds;
    for (var i = 0; i < 10; i++) {
      int seed = Random().nextInt(100000);
      state.imageSeeds.add(seed);
    }
    _currentSate = state;
    emit(state);
    return null;
  }
}
