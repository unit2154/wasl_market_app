class Endpoints {
  static const String baseUrl = 'https://www.vorhex.com/api';
  static const String sendOtp = '/customer/auth/send-otp';
  static const String verifyOtp = '/customer/auth/verify-otp';
  static const String logout = '/customer/auth/logout';
  static const String products = '/company/items';
  static const String endMarketProducts = '/customer/items';
  static const String orders = '/company/orders';
  static const String createNewOrder = '/customer/orders';
  static const String masterOrders = '/customer/master-orders';
  static const String categories = '/customer/categories';
  static const String companies = '/customer/companies';
  static const String brands = '/customer/brands';
  static const String searchSuggestions = '/customer/search/suggest';
}
