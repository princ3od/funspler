class ApiPath {
  static const baseURL = 'https://picsum.photos/';
  static String squareImage({int width = 350, required int seed}) =>
      '$baseURL/seed/$seed/$width';
  static String verticalImage(
          {int width = 350, required int height, required int seed}) =>
      '$baseURL/seed/$seed/$width/$height';
}
