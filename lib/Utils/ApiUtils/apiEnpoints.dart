class ApiEndpoint{

  static const String baseImageUrl = "https://dashboard.gagcars.com/storage/";

  // auth
  static const String verifyOtp = "/otp/verify";
  static const String authenticateUser = "/user"; // verifies token to keep user logged in
  static const String updateProfile = "/update-profile";

  // homepage
  static const String items = "/items"; // recommended items
  static const String brands = "/brands";  // makes and models
  static const String brandModel = "/brand-models";
  static const String specialOffers = "/special-offers";
  static const String myWishlist = "/my/wish-list";
  static const String myListings = "/my/listings"; 
  static const String categories = "/categories";
  static const String posts = "/posts";
  static const String canUpload = "/app/can-upload";
  static const String similarItemsByCategory = "/app/similar-items-by-category";
  
  static const String resetPassword = '/reset-password';
  static const String sendResetPasswordOtp = '/send-reset-password-otp';
  static const String logoutUser = "/auth/logout";

  // profiles
  static const String verifications = "/verifications";
  static const String countries = "/countries";

  // payment
  static const String packages = "/packages";
}
