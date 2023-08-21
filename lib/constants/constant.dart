class AppConstants {
  static String baseUrl =
      'https://list.ly/api/v4/lists/trending?page=1&per_page=10';
  static var headers = {
    'Content-Type': 'application/json',
    "Connection": "Keep-Alive",
    // "Keep-Alive": "timeout=5, max=1000"
  };
}
