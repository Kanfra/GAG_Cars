import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/wishlistModel.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiEnpoints.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:logger/logger.dart';

class WishlistService{
  final logger = Logger();
  
  
  Future<bool> toggleWishlistItem({
    required String itemId,
  }) async {
    final endpoint = '${ApiEndpoint.myWishlist}/$itemId';
    final Map<String, dynamic> body = {};
    final Map<String, dynamic> fromJson = {};
    return postApiData<bool>(
      endpoint: endpoint,
      body: body, 
      fromJson: (json) => false,
    );
  }

  Future<List<WishlistItem>> fetchWishlist({
    int page = 1,
    int perPage = 10
  }) async {
    final response = await fetchApiData(
      endpoint: ApiEndpoint.myWishlist, 
      fromJson: (json){
        logger.i("Raw API response: $json");
        return WishlistResponse.fromJson(json);
        },
      );
      return response.data;
  }

  // Future<bool> toggleWishlistItem({
  //   required String itemId,
  // }) async {
  //   final endpoint = '$_baseUrl/my/wish-list/$itemId';
  //   final headers = {
  //     'Authorization': 'Bearer $token',
  //     'Accept': 'application/json',
  //   };
  //   final uri = 
  //   try{
  //     logger.i('Toggling wishlist for item: $itemId');

  //     // first check current status
  //     final checkResponse = await http.post(

  //     );
  //   }
  // }
}