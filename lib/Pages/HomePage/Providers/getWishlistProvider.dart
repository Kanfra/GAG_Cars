import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/itemsModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/wishlistModel.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/WishlistService/wishlistService.dart';
import 'package:logger/logger.dart';

class GetWishlistProvider with ChangeNotifier {
  
  final WishlistService _wishlistService;
  final Logger logger = Logger();

  List<WishlistItem> _items = [];
  bool _isLoading = false;
  String _errorMessage = "";


  bool get isLoading => _isLoading;
  String get isErrorMessage => _errorMessage;
  List<WishlistItem> get items => _items;

  GetWishlistProvider(this._wishlistService);

  // fetch items
  Future<void> fetchItems() async {
    try{
      _isLoading = true;
      _errorMessage = "";
      notifyListeners();

      final  response = await _wishlistService.fetchWishlist();
      _items = response;
    } catch(e){
      _errorMessage = "Failed to load items";
      logger.e("Error: $e");
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // refresh items
  Future<void> refresh() => fetchItems();

}