class ApiPath {
  static const baseURL = 'https://picsum.photos/';
  static String squareImage({int width = 350}) => '$baseURL/$width';
  static String verticalImage({int width = 350, required int height}) =>
      '$baseURL/$width/$height';
}
