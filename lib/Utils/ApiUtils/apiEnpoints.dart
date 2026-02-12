class ApiEndpoint{

  static const String baseImageUrl = "https://dashboard.gagcars.com/storage/";

  // auth
  static const String logInWithEmail = "/sanctum/token";
  static const String sendOtp = "/otp/send";
  static const String verifyOtp = "/otp/verify";
  static const String authenticateUser = "/user"; // verifies token to keep user logged in
  static const String updateProfile = "/update-profile";
  static const String deleteUser = "/user";

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
  static const String similarItemsByBrand = "/app/similar-items-by-brand";
  static const String brandItems = "/app/brand-items";
  static const String searchItems = "/app/search-items";
  static const String notifications = "/my/notifications";
  static const String broadcasts = "/broadcasts";
  
  static const String resetPassword = '/reset-password';
  static const String sendResetPasswordOtp = '/send-reset-password-otp';
  static const String logoutUser = "/auth/logout";

  // profiles
  static const String verifications = "/verifications";
  static const String countries = "/app/countries";
  static const String changePassword = "/change-password";
  static const String faqs = "/faqs";
  static const String faqCategories = "/faq-categories";

  // chat
  static const String fetchMessages = "/chat/fetchMessages";
  static const String getContacts = "/chat/getContacts";
  static const String sendMessage = "/chat/sendMessage";

  // payment
  static const String packagesByCategory = "/app/packages-by-category";
}
