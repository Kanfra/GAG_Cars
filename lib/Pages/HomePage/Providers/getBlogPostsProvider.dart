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

  // Track loading states per category for multi-tab support
  final Map<String, bool> _categoryLoadingStates = {};
  final Map<String, int> _categoryCurrentPages = {};
  final Map<String, bool> _categoryHasMore = {};

  BlogPostProvider(this._blogPostService);

  // Getters
  PostsResponse? get postsResponse => _postsResponse;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get hasMore => _hasMore;
  int get currentPage => _currentPage;
  List<Post> get posts => _postsResponse?.data ?? [];

  // Category-specific getters
  bool isCategoryLoading(String categoryName) => _categoryLoadingStates[categoryName] ?? false;
  bool hasMoreInCategory(String categoryName) => _categoryHasMore[categoryName] ?? true;
  int currentPageInCategory(String categoryName) => _categoryCurrentPages[categoryName] ?? 1;

  // Main method to fetch posts
  Future<void> fetchPosts({bool refresh = false, String? category}) async {
    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
      if (category == null) {
        _postsResponse = null;
      }
      // Reset category-specific states if refreshing a specific category
      if (category != null) {
        _categoryCurrentPages[category] = 1;
        _categoryHasMore[category] = true;
      }
    } else if (_isLoading || _isLoadingMore) {
      return;
    }

    if (!refresh && !_hasMore) {
      return;
    }

    final pageToFetch = refresh ? 1 : _currentPage;
    
    if (refresh) {
      _setLoading(true);
    } else {
      if (category != null) {
        _categoryLoadingStates[category] = true;
      } else {
        _isLoadingMore = true;
      }
    }
    
    _error = null;
    notifyListeners();

    try {
      // Build query parameters
      final Map<String, dynamic> queryParams = {'page': pageToFetch.toString()};
      if (category != null) {
        queryParams['category'] = category;
      }
      
      final response = await _blogPostService.getPosts(queryParams: queryParams);
      
      if (refresh || _postsResponse == null) {
        _postsResponse = response;
        _currentPage = 1;
      } else {
        _postsResponse = _postsResponse!.copyWith(
          data: [..._postsResponse!.data, ...response.data],
          links: response.links,
          meta: response.meta,
        );
        _currentPage = pageToFetch;
      }

      _hasMore = response.links.next != null;
      
      // Update category-specific states
      if (category != null) {
        _categoryCurrentPages[category] = pageToFetch;
        _categoryHasMore[category] = response.links.next != null;
      }
      
    } catch (e) {
      _error = e.toString();
      if (refresh) {
        _postsResponse = null;
      }
    } finally {
      if (refresh) {
        _setLoading(false);
      } else {
        if (category != null) {
          _categoryLoadingStates[category] = false;
        } else {
          _isLoadingMore = false;
        }
      }
      notifyListeners();
    }
  }

  // Load more posts for pagination
  Future<void> loadMorePosts({String? category}) async {
    if (_isLoadingMore || !_hasMore || _isLoading) return;

    // Check category-specific loading states
    if (category != null && (_categoryLoadingStates[category] == true || !(_categoryHasMore[category] ?? true))) {
      return;
    }

    if (category != null) {
      _categoryLoadingStates[category] = true;
    } else {
      _isLoadingMore = true;
    }
    
    notifyListeners();

    try {
      final nextPage = category != null 
          ? (_categoryCurrentPages[category] ?? 1) + 1
          : _currentPage + 1;
          
      // Build query parameters
      final Map<String, dynamic> queryParams = {'page': nextPage.toString()};
      if (category != null) {
        queryParams['category'] = category;
      }
      
      final response = await _blogPostService.getPosts(queryParams: queryParams);
      
      _postsResponse = _postsResponse!.copyWith(
        data: [..._postsResponse!.data, ...response.data],
        links: response.links,
        meta: response.meta,
      );

      if (category != null) {
        _categoryCurrentPages[category] = nextPage;
        _categoryHasMore[category] = response.links.next != null;
      } else {
        _currentPage = nextPage;
        _hasMore = response.links.next != null;
      }
      
    } catch (e) {
      _error = e.toString();
    } finally {
      if (category != null) {
        _categoryLoadingStates[category] = false;
      } else {
        _isLoadingMore = false;
      }
      notifyListeners();
    }
  }

  // Fetch posts by category name
  Future<void> fetchPostsByCategoryName(String categoryName, {bool refresh = false}) async {
    await fetchPosts(refresh: refresh, category: categoryName);
  }

  // Get single post by ID
  Future<Post?> getPostById(String postId) async {
    try {
      _setLoading(true);
      notifyListeners();

      final post = await _blogPostService.getPostById(postId);
      return post;
    } catch (e) {
      _error = e.toString();
      return null;
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void refresh({String? category}) {
    _error = null;
    notifyListeners();
    fetchPosts(refresh: true, category: category);
  }

  // Post filtering helpers - FIXED VERSION
  Post? getPostByIdFromCache(String id) {
    try {
      return posts.firstWhere((post) => post.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Post> getPostsByStatus(String status) {
    return posts.where((post) => post.status == status).toList();
  }

  List<Post> getPostsByCategory(int categoryId) {
    return posts.where((post) => post.categoryId == categoryId).toList();
  }

  // FIXED: This was the main issue - using exact match instead of tab name matching
  List<Post> getPostsByCategoryNameFromCache(String categoryName) {
    if (categoryName == 'All News') return posts;
    
    return posts.where((post) => 
        post.category.name.toLowerCase() == categoryName.toLowerCase()
    ).toList();
  }

  List<Post> get publishedPosts {
    return getPostsByStatus('published');
  }

  // Clear all data
  void clear() {
    _postsResponse = null;
    _currentPage = 1;
    _hasMore = true;
    _error = null;
    _isLoading = false;
    _isLoadingMore = false;
    _categoryLoadingStates.clear();
    _categoryCurrentPages.clear();
    _categoryHasMore.clear();
    notifyListeners();
  }

  // Debug method to check categories
  void debugCategories() {
    final categories = posts.map((post) => post.category.name).toSet();
    print('=== DEBUG CATEGORIES ===');
    print('Available categories: $categories');
    print('Total posts: ${posts.length}');
    
    for (final category in categories) {
      final filtered = getPostsByCategoryNameFromCache(category);
      print('Category "$category": ${filtered.length} posts');
    }
    print('=======================');
  }
}