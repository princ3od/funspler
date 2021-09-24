abstract class HomeState {
  late int mainImageSeed;
  late int imageCount;
  List<int> imageSeeds = [];
  HomeState();
}

class HomeStateIntial extends HomeState {
  HomeStateIntial();
}

class HomeStateFetching extends HomeState {
  HomeStateFetching();
}

class HomeStateFinished extends HomeState {
  HomeStateFinished();
}
