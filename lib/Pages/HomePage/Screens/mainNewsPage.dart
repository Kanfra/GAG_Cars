import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/themeProvider.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/HomePage/Models/postResponse.dart';
import 'package:gag_cars_frontend/Utils/ApiUtils/apiUtils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:provider/provider.dart';

class MainNewsPage extends StatefulWidget {
  final Post post;
  
  const MainNewsPage({
    super.key,
    required this.post,
  });

  @override
  State<MainNewsPage> createState() => _MainNewsPageState();
}

class _MainNewsPageState extends State<MainNewsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBarShadow = false;
  bool _isLiked = false;
  int _likeCount = 0;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _likeCount = _calculateLikes(widget.post);
    
    _scrollController.addListener(() {
      if (_scrollController.offset > 100 && !_showAppBarShadow) {
        setState(() => _showAppBarShadow = true);
      } else if (_scrollController.offset <= 100 && _showAppBarShadow) {
        setState(() => _showAppBarShadow = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int _calculateLikes(Post post) {
    final hoursSincePosted = DateTime.now().difference(post.createdAt).inHours;
    return (hoursSincePosted * 0.1).ceil();
  }

  int _calculateReadingTime(String content) {
    final wordCount = content.split(RegExp(r'\s+')).length;
    return (wordCount / 200).ceil();
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

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likeCount = _isLiked ? _likeCount + 1 : _likeCount - 1;
    });
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  void _shareArticle() {
    final String shareText = '${widget.post.title}\n\n${_cleanHtmlContent(widget.post.description ?? 'Check out this article on GAG Cars!')}';
    Share.share(shareText);
  }

  // HTML cleaning helper method
  String _cleanHtmlContent(String htmlContent) {
    // Remove HTML tags and decode HTML entities if needed
    String cleaned = htmlContent.replaceAll(RegExp(r'<[^>]*>'), '').trim();
    
    // Replace common HTML entities
    cleaned = cleaned
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ');
    
    return cleaned;
  }

  Widget _buildImageShimmer(bool isDarkMode) {
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
      highlightColor: isDarkMode ? Colors.grey.shade600 : Colors.grey.shade100,
      child: Container(
        height: 300,
        width: double.infinity,
        color: isDarkMode ? const Color(0xFF424242) : Colors.white,
      ),
    );
  }

  Widget _buildAuthorInfo(bool isDarkMode) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: ColorGlobalVariables.brownColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person,
            color: ColorGlobalVariables.brownColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GAG Editorial',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                _formatDate(widget.post.createdAt),
                style: TextStyle(
                  fontSize: 13,
                  color: isDarkMode ? Colors.white60 : Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? iconColor,
    bool isActive = false,
    required bool isDarkMode,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF424242) : Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: isDarkMode ? Border.all(color: const Color(0xFF616161)) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: iconColor ?? (isActive ? ColorGlobalVariables.brownColor : (isDarkMode ? Colors.white70 : Colors.grey.shade600)),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isActive ? ColorGlobalVariables.brownColor : (isDarkMode ? Colors.white70 : Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagChips() {
    // Since tags is empty, return nothing
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.white,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: screenSize.height * 0.35,
              collapsedHeight: 70,
              pinned: true,
              floating: false,
              backgroundColor: isDarkMode ? const Color(0xFF424242) : Colors.white,
              elevation: _showAppBarShadow ? 4 : 0,
              shadowColor: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xFF616161) : Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 18,
                      color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                    ),
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Container(
              //       width: 36,
              //       height: 36,
              //       decoration: BoxDecoration(
              //         color: isDarkMode ? const Color(0xFF616161) : Colors.white,
              //         shape: BoxShape.circle,
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.1),
              //             blurRadius: 8,
              //             offset: const Offset(0, 2),
              //           ),
              //         ],
              //       ),
              //       child: IconButton(
              //         icon: Icon(
              //           _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              //           size: 18,
              //           color: _isBookmarked ? ColorGlobalVariables.brownColor : (isDarkMode ? Colors.white : ColorGlobalVariables.blackColor),
              //         ),
              //         onPressed: _toggleBookmark,
              //         padding: EdgeInsets.zero,
              //       ),
              //     ),
              //   ),
              //   const SizedBox(width: 8),
              // ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: getImageUrl(widget.post.image, null),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => _buildImageShimmer(isDarkMode),
                      errorWidget: (context, url, error) {
                        return Container(
                          color: isDarkMode ? const Color(0xFF424242) : Colors.grey.shade100,
                          child: Icon(
                            Icons.article_outlined,
                            color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade400,
                            size: 50,
                          ),
                        );
                      },
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                    // Category badge
                    Positioned(
                      top: 50,
                      left: 60,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: ColorGlobalVariables.redColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          widget.post.category.name.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Content Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      
                      // Title
                      Text(
                        _cleanHtmlContent(widget.post.title), // Clean title too, just in case
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                          height: 1.3,
                        ),
                      ),
                      
                      // const SizedBox(height: 20),
                      
                      // // Meta Information - FIXED VERSION
                      // LayoutBuilder(
                      //   builder: (context, constraints) {
                      //     return Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Expanded(
                      //           flex: 2,
                      //           child: _buildAuthorInfo(isDarkMode),
                      //         ),
                      //         // const SizedBox(width: 12),
                      //         // Container(
                      //         //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      //         //   decoration: BoxDecoration(
                      //         //     color: isDarkMode ? const Color(0xFF424242) : Colors.grey.shade100,
                      //         //     borderRadius: BorderRadius.circular(12),
                      //         //     border: isDarkMode ? Border.all(color: const Color(0xFF616161)) : null,
                      //         //   ),
                      //         //   child: Row(
                      //         //     mainAxisSize: MainAxisSize.min,
                      //         //     children: [
                      //         //       Icon(
                      //         //         Icons.schedule, 
                      //         //         size: 14, 
                      //         //         color: isDarkMode ? Colors.white60 : Colors.grey.shade600
                      //         //       ),
                      //         //       const SizedBox(width: 4),
                      //         //       Text(
                      //         //         '${_calculateReadingTime(widget.post.content)} min read',
                      //         //         style: TextStyle(
                      //         //           fontSize: 12,
                      //         //           fontWeight: FontWeight.w600,
                      //         //           color: isDarkMode ? Colors.white60 : Colors.grey.shade600,
                      //         //         ),
                      //         //       ),
                      //         //     ],
                      //         //   ),
                      //         // ),
                      //       ],
                      //     );
                      //   },
                      // ),
                      
                      const SizedBox(height: 24),
                      
                      // Description
                      if (widget.post.description != null && widget.post.description!.isNotEmpty)
                        Column(
                          children: [
                            Text(
                              _cleanHtmlContent(widget.post.description!), // Clean description
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode ? Colors.white70 : Colors.grey.shade700,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      
                      // Main Content - CLEANED HTML
                      Text(
                        _cleanHtmlContent(widget.post.content), // Clean main content
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode ? Colors.white70 : Colors.grey.shade800,
                          height: 1.7,
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Tags - This will be empty since tags list is empty
                      _buildTagChips(),
                      
                      const SizedBox(height: 32),
                      
                      // Divider
                      Divider(
                        color: isDarkMode ? const Color(0xFF616161) : Colors.grey.shade200,
                        height: 1,
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Action Buttons - FIXED VERSION
                      // Wrap(
                      //   spacing: 8,
                      //   runSpacing: 8,
                      //   alignment: WrapAlignment.spaceEvenly,
                      //   children: [
                      //     _buildActionButton(
                      //       icon: _isLiked ? Icons.favorite : Icons.favorite_outline,
                      //       label: '$_likeCount',
                      //       onTap: _toggleLike,
                      //       iconColor: _isLiked ? Colors.red : null,
                      //       isActive: _isLiked,
                      //       isDarkMode: isDarkMode,
                      //     ),
                      //     _buildActionButton(
                      //       icon: Icons.comment_outlined,
                      //       label: 'Comment',
                      //       onTap: () {
                      //         // TODO: Implement comments
                      //       },
                      //       isDarkMode: isDarkMode,
                      //     ),
                      //     _buildActionButton(
                      //       icon: Icons.share_outlined,
                      //       label: 'Share',
                      //       onTap: _shareArticle,
                      //       isDarkMode: isDarkMode,
                      //     ),
                      //   ],
                      // ),
                      
                      // const SizedBox(height: 32),
                      
                      // Author Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: isDarkMode ? const Color(0xFF424242) : Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isDarkMode ? const Color(0xFF616161) : Colors.grey.shade200
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: ColorGlobalVariables.brownColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.person,
                                color: ColorGlobalVariables.brownColor,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Written by GAG Editorial',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: isDarkMode ? Colors.white : ColorGlobalVariables.blackColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Bringing you the latest automotive news, reviews, and industry insights from trusted sources worldwide.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isDarkMode ? Colors.white60 : Colors.grey.shade600,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      
      // Floating Action Button for quick actions
      floatingActionButton: FloatingActionButton(
        onPressed: _shareArticle,
        backgroundColor: ColorGlobalVariables.brownColor,
        child: const Icon(Icons.share, color: Colors.white),
      ),
    );
  }
}