import 'package:flutter/foundation.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/postResponse.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Services/BlogPostService/blogPostService.dart';

class BlogPostProvider with ChangeNotifier {
  final BlogPostService _blogPostService;
  
  PostsResponse? _postsResponse;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _error;
  bool _hasMore = true;
  int _currentPage = 1;

  BlogPostProvider(this._blogPostService);

  PostsResponse? get postsResponse => _postsResponse;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get hasMore => _hasMore;
  List<Post> get posts => _postsResponse?.data ?? [];

  Future<void> fetchPosts({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
    }

    _setLoading(true);
    _error = null;
    notifyListeners();

    try {
      final response = await _blogPostService.getPosts(page: _currentPage);
      
      if (refresh || _postsResponse == null) {
        _postsResponse = response;
      } else {
        // For pagination - merge new posts with existing ones
        _postsResponse = _postsResponse!.copyWith(
          data: [..._postsResponse!.data, ...response.data],
          links: response.links,
          meta: response.meta,
        );
      }

      _hasMore = response.links.next != null;
      
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  Future<void> loadMorePosts() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      _currentPage++;
      final response = await _blogPostService.getPosts(page: _currentPage);
      
      _postsResponse = _postsResponse!.copyWith(
        data: [..._postsResponse!.data, ...response.data],
        links: response.links,
        meta: response.meta,
      );

      _hasMore = response.links.next != null;
      
    } catch (e) {
      _currentPage--; // Revert page on error
      _error = e.toString();
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void refresh() {
    _postsResponse = null;
    _error = null;
    _currentPage = 1;
    _hasMore = true;
    notifyListeners();
    fetchPosts(refresh: true);
  }
}