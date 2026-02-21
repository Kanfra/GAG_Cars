import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/postResponse.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Providers/getBlogPostsProvider.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsBlogPage extends StatefulWidget {
  const NewsBlogPage({super.key});

  @override
  State<NewsBlogPage> createState() => _NewsBlogPageState();
}

class _NewsBlogPageState extends State<NewsBlogPage> with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _tabTitles = ['All News'];
  bool _isInitialLoad = true;
  bool _hasFetchedData = false;
  
  // Search functionality
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  String _searchQuery = '';
  
  // Refresh controllers - REMOVED _scrollController since we're using NestedScrollView's internal one
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final Map<String, RefreshController> _tabRefreshControllers = {};
  final Map<String, ScrollController> _tabScrollControllers = {};

  @override
  void initState() {
    super.initState();
    
    _tabController = TabController(length: 1, vsync: this);
    
    // Initialize controllers for initial tab
    _initializeTabControllers('All News');
    
    // Add listener to search controller
    _searchController.addListener(_onSearchChanged);
    
    // Add tab change listener
    _tabController.addListener(_onTabChange);
  }

  void _initializeTabControllers(String tabName) {
    if (!_tabScrollControllers.containsKey(tabName)) {
      _tabScrollControllers[tabName] = ScrollController();
      _tabScrollControllers[tabName]!.addListener(() => _handleScroll(tabName));
    }
    
    if (!_tabRefreshControllers.containsKey(tabName)) {
      _tabRefreshControllers[tabName] = RefreshController();
    }
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.trim();
    });
  }

  void _onTabChange() {
    if (mounted) {
      setState(() {}); // Force rebuild when tab changes
    }
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
    });
  }

  // Filter posts based on search query
  List<Post> _filterPostsBySearch(List<Post> posts, String query) {
    if (query.isEmpty) return posts;

    final lowercaseQuery = query.toLowerCase();
    
    return posts.where((post) {
      // Search in multiple fields
      final matchesTitle = post.title.toLowerCase().contains(lowercaseQuery);
      final matchesDescription = post.description?.toLowerCase().contains(lowercaseQuery) ?? false;
      final matchesContent = post.content.toLowerCase().contains(lowercaseQuery);
      final matchesCategory = post.category.name.toLowerCase().contains(lowercaseQuery);
      final matchesTags = post.tags.any((tag) => tag.toLowerCase().contains(lowercaseQuery));
      
      return matchesTitle || matchesDescription || matchesContent || matchesCategory || matchesTags;
    }).toList();
  }

  // Get posts for current tab with search applied
  List<Post> _getPostsForCurrentTab(BlogPostProvider provider) {
    if (_tabTitles.isEmpty) return [];
    
    final currentTab = _tabTitles[_tabController.index];
    List<Post> basePosts;

    if (currentTab == 'All News') {
      basePosts = provider.posts;
    } else {
      basePosts = provider.getPostsByCategoryNameFromCache(currentTab);
    }

    // Apply search filter if there's a search query
    if (_searchQuery.isNotEmpty) {
      return _filterPostsBySearch(basePosts, _searchQuery);
    }

    return basePosts;
  }

  void _fetchPostsAfterBuild() {
    if (_hasFetchedData) return;
    
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final blogPostProvider = Provider.of<BlogPostProvider>(context, listen: false);
        
        if (blogPostProvider.posts.isEmpty && !blogPostProvider.isLoading) {
          await blogPostProvider.fetchPosts(refresh: true);
        }
        
        // Debug: Check what we have
        blogPostProvider.debugCategories();
        
        _updateTabsWithCategories(blogPostProvider.posts);
        _hasFetchedData = true;
      } catch (e) {
        debugPrint('Error fetching posts: $e');
      } finally {
        if (mounted) {
          setState(() {
            _isInitialLoad = false;
          });
        }
      }
    });
  }

  void _updateTabsWithCategories(List<Post> posts) {
    if (!mounted) return;

    final categories = <String>{};
    for (final post in posts) {
      categories.add(post.category.name);
    }

    final newTabTitles = ['All News', ...categories];
    
    // Initialize controllers for new tabs
    for (final title in newTabTitles) {
      _initializeTabControllers(title);
    }

    if (newTabTitles.length != _tabTitles.length || !listEquals(newTabTitles, _tabTitles)) {
      setState(() {
        _tabTitles = newTabTitles;
        
        _tabController.dispose();
        _tabController = TabController(length: _tabTitles.length, vsync: this);
        _tabController.addListener(_onTabChange);
      });
    }
  }

  void _handleScroll(String tabName) {
    final scrollController = _tabScrollControllers[tabName];
    final blogPostProvider = Provider.of<BlogPostProvider>(context, listen: false);
    
    if (scrollController == null) return;
    
    if (scrollController.offset >= scrollController.position.maxScrollExtent - 200 &&
        !blogPostProvider.isLoadingMore &&
        blogPostProvider.hasMore &&
        _searchQuery.isEmpty) {
      _loadMorePosts(tabName);
    }
  }

  Future<void> _loadMorePosts(String tabTitle) async {
    final blogPostProvider = Provider.of<BlogPostProvider>(context, listen: false);
    
    if (blogPostProvider.isLoadingMore || !blogPostProvider.hasMore) return;
    
    try {
      await blogPostProvider.loadMorePosts(category: tabTitle == 'All News' ? null : tabTitle);
    } catch (e) {
      debugPrint('Error loading more posts for $tabTitle: $e');
    }
  }

  Future<void> _onRefresh(String tabTitle) async {
    try {
      final blogPostProvider = Provider.of<BlogPostProvider>(context, listen: false);
      
      if (tabTitle == 'All News') {
        await blogPostProvider.fetchPosts(refresh: true);
      } else {
        await blogPostProvider.fetchPosts(refresh: true, category: tabTitle);
      }
      
      _tabRefreshControllers[tabTitle]?.refreshCompleted();
    } catch (e) {
      debugPrint('Refresh error: $e');
      _tabRefreshControllers[tabTitle]?.refreshFailed();
    }
  }

  Widget _buildContent() {
    return Consumer<BlogPostProvider>(
      builder: (context, blogPostProvider, child) {
        final currentPosts = _getPostsForCurrentTab(blogPostProvider);
        final currentTab = _tabTitles.isNotEmpty ? _tabTitles[_tabController.index] : 'All News';
        
        return SmartRefresher(
          controller: _tabRefreshControllers[currentTab] ?? _refreshController,
          onRefresh: () => _onRefresh(currentTab),
          onLoading: _searchQuery.isEmpty ? () => _loadMorePosts(currentTab) : null,
          enablePullDown: true,
          enablePullUp: blogPostProvider.hasMore && _searchQuery.isEmpty,
          header: ClassicHeader(
            height: 60,
            completeIcon: Icon(Icons.check, color: ColorGlobalVariables.brownColor),
            completeText: 'Refresh Complete',
            refreshingIcon: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
              ),
            ),
            refreshingText: 'Refreshing...',
            releaseIcon: Icon(Icons.arrow_upward, color: ColorGlobalVariables.brownColor),
            releaseText: 'Release to refresh',
            idleIcon: Icon(Icons.arrow_downward, color: Colors.grey.shade400),
            idleText: 'Pull down to refresh',
            textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          footer: CustomFooter(
            height: 60,
            builder: (context, mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text("Pull up to load more", 
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12));
              } else if (mode == LoadStatus.loading) {
                body = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text("Loading more...", 
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  ],
                );
              } else if (mode == LoadStatus.failed) {
                body = Text("Load failed! Click retry!", 
                  style: TextStyle(color: Colors.red.shade600, fontSize: 12));
              } else if (mode == LoadStatus.canLoading) {
                body = Text("Release to load more", 
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12));
              } else {
                body = Text("No more articles", 
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12));
              }
              return SizedBox(
                height: 60,
                child: Center(child: body),
              );
            },
          ),
          child: _buildPostList(currentPosts, currentTab, blogPostProvider),
        );
      },
    );
  }

  Widget _buildPostList(List<Post> posts, String tabTitle, BlogPostProvider blogPostProvider) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final isDarkMode = themeProvider.isDarkMode;
    
    final isLoadingMore = blogPostProvider.isLoadingMore && _searchQuery.isEmpty;

    if (posts.isEmpty) {
      return _searchQuery.isNotEmpty ? _buildSearchEmptyState(isDarkMode) : _buildEmptyState(isDarkMode);
    }

    return ListView.builder(
      controller: _tabScrollControllers[tabTitle],
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: posts.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < posts.length) {
          final post = posts[index];
          return _buildPostCard(post, tabTitle != 'All News', index, isDarkMode);
        } else {
          return _buildLoadMoreIndicator(isDarkMode);
        }
      },
    );
  }

  Widget _buildPostCard(Post post, bool showCategoryBadge, int index, bool isDarkMode) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300 + (index * 100)),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.toNamed(RouteClass.getMainNewsPage(), arguments: post);
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDarkMode ? 0.2 : 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: getImageUrl(post.image, null),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => _buildImageShimmer(isDarkMode),
                          errorWidget: (context, url, error) {
                            return Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    ColorGlobalVariables.brownColor.withValues(alpha: 0.1),
                                    ColorGlobalVariables.brownColor.withValues(alpha: 0.3),
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.article_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            );
                          },
                        ),
                      ),
                      
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.3),
                            ],
                          ),
                        ),
                      ),
                      
                      if (showCategoryBadge)
                        Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: ColorGlobalVariables.redColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              post.category.name.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      
                      // Positioned(
                      //   top: 12,
                      //   right: 12,
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      //     decoration: BoxDecoration(
                      //       color: Colors.black.withValues(alpha: 0.7),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         Icon(Icons.schedule, color: Colors.white, size: 12),
                      //         const SizedBox(width: 4),
                      //         Text(
                      //           '${_calculateReadingTime(post.content)} min',
                      //           style: const TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        const SizedBox(height: 12),
                        
                        Text(
                          post.description ?? 'Discover the latest insights in automotive innovation...',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: isDarkMode ? Colors.white70 : Colors.grey.shade700,
                            height: 1.5,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: ColorGlobalVariables.brownColor.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: ColorGlobalVariables.brownColor,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'GAG Editorial',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                                      ),
                                    ),
                                    Text(
                                      _formatDate(post.createdAt),
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: isDarkMode ? Colors.white60 : Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            // Row(
                            //   children: [
                            //     _buildEngagementStat(
                            //       icon: Icons.favorite_outline,
                            //       count: _calculateLikes(post),
                            //       color: Colors.red.shade400,
                            //       isDarkMode: isDarkMode,
                            //     ),
                            //     const SizedBox(width: 16),
                            //     _buildEngagementStat(
                            //       icon: Icons.comment_outlined,
                            //       count: post.tags.length.toString(),
                            //       color: Colors.blue.shade400,
                            //       isDarkMode: isDarkMode,
                            //     ),
                            //     const SizedBox(width: 16),
                            //     _buildEngagementStat(
                            //       icon: Icons.share_outlined,
                            //       count: '0',
                            //       color: Colors.green.shade400,
                            //       isDarkMode: isDarkMode,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEngagementStat({required IconData icon, required String count, required Color color, required bool isDarkMode}) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          count,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.article_outlined,
              size: 50,
              color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No Articles Yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Check back later for new content',
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.white60 : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchEmptyState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF424242) : Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search_off,
              size: 50,
              color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No Results Found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.white60 : Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 16),
          if (_searchQuery.isNotEmpty)
            Text(
              'Searching for: "$_searchQuery"',
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.white60 : Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoadMoreIndicator(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Loading more articles...',
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageShimmer(bool isDarkMode) {
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
      highlightColor: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade100,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 365) return '${(difference.inDays / 365).floor()}y ago';
    if (difference.inDays > 30) return '${(difference.inDays / 30).floor()}mo ago';
    if (difference.inDays > 0) return '${difference.inDays}d ago';
    if (difference.inHours > 0) return '${difference.inHours}h ago';
    return 'Just now';
  }

  String _calculateLikes(Post post) {
    final hoursSincePosted = DateTime.now().difference(post.createdAt).inHours;
    return '${(hoursSincePosted * 0.1).ceil()}';
  }

  int _calculateReadingTime(String content) {
    final wordCount = content.split(RegExp(r'\s+')).length;
    return (wordCount / 200).ceil();
  }

  bool get _shouldTabsBeScrollable {
    return _tabTitles.length > 3;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _refreshController.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    
    // Dispose all tab scroll controllers
    for (final controller in _tabScrollControllers.values) {
      controller.dispose();
    }
    for (final controller in _tabRefreshControllers.values) {
      controller.dispose();
    }
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    if (_isInitialLoad) {
      _fetchPostsAfterBuild();
    }

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey.shade50,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
              elevation: innerBoxIsScrolled ? 4 : 0,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 140,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isDarkMode
                          ? [
                              const Color(0xFF424242),
                              const Color(0xFF303030),
                            ]
                          : [
                              Colors.white,
                              Colors.grey.shade50,
                            ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70, left: 24, right: 24, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'GAG News',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: ColorGlobalVariables.brownColor,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Latest automotive insights & industry news',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF616161) : Colors.grey.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                      color: isDarkMode ? Colors.white70 : ColorGlobalVariables.fadedBlackColor,
                    ),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF616161) : Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.notifications_outlined,
                            size: 18,
                            color: isDarkMode ? Colors.white70 : Colors.grey.shade700,
                          ),
                          onPressed: () {
                            Get.toNamed(RouteClass.getNotificationsPage());
                          },
                          padding: EdgeInsets.zero,
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDarkMode ? const Color(0xFF424242) : Colors.white, 
                                width: 1.5
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: isDarkMode ? 0.1 : 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Search articles, brands, topics...',
                      hintStyle: TextStyle(
                        color: isDarkMode ? Colors.white60 : Colors.grey.shade500,
                        fontSize: 14,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: Icon(
                          Icons.search_rounded, 
                          color: isDarkMode ? Colors.white60 : Colors.grey.shade500, 
                          size: 20
                        ),
                      ),
                      suffixIcon: _searchQuery.isNotEmpty ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: isDarkMode ? Colors.white60 : Colors.grey.shade500,
                            size: 20,
                          ),
                          onPressed: _clearSearch,
                        ),
                      ) : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: isDarkMode ? 0.1 : 0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: _shouldTabsBeScrollable,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              ColorGlobalVariables.brownColor,
                              ColorGlobalVariables.brownColor.withValues(alpha: 0.8),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorGlobalVariables.brownColor.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.white,
                        unselectedLabelColor: isDarkMode ? Colors.white60 : Colors.grey.shade600,
                        labelStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? Colors.white60 : Colors.grey.shade600,
                        ),
                        tabs: _tabTitles.map((title) => Tab(
                          child: Container(
                            constraints: _shouldTabsBeScrollable 
                                ? const BoxConstraints(minWidth: 80)
                                : null,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: _isInitialLoad ? _buildLoadingState(isDarkMode) : _buildContent(),
      ),
    );
  }

  Widget _buildLoadingState(bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
              backgroundColor: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading Articles',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Discovering the latest automotive news',
            style: TextStyle(
              fontSize: 12,
              color: isDarkMode ? Colors.white60 : Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}