class ApiEndpoint{

  static const String baseImageUrl = "https://dashboard.gagcars.com/storage/";

  // auth
  static const String verifyOtp = "/otp/verify";
  static const String authenticateUser = "/user"; // verifies token to keep user logged in

  // homepage
  static const String items = "/items";
  static const String brands = "/brands";  // makes and models
  static const String brandModel = "/brand-models";
  static const String specialOffers = "/special-offers";
  static const String myWishlist = "/my/wish-list";
  // static const String recommended = "/items";  // /items
  static const String categories = "/categories";
  
  static const String resetPassword = '/reset-password';
  static const String sendResetPasswordOtp = '/send-reset-password-otp';
  static const String logoutUser = "/auth/logout";
}