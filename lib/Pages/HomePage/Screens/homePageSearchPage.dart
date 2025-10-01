import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:get/get.dart';

class HomePageSearchPage extends StatefulWidget {
  @override
  _HomePageSearchPageState createState() => _HomePageSearchPageState();
}

class _HomePageSearchPageState extends State<HomePageSearchPage> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  final List<String> _recentSearches = [
    'Toyota Camry 2020',
    'BMW X5',
    'Mercedes Benz',
    'Honda Civic',
    'Range Rover Sport'
  ];

  final List<String> _popularSearches = [
    'Tesla Model 3',
    'Ford Mustang',
    'Porsche 911',
    'Audi Q7',
    'Jeep Wrangler',
    'Nissan Altima'
  ];

  final List<Map<String, dynamic>> _searchCategories = [
    {'icon': Icons.directions_car, 'title': 'Cars', 'count': '1,234'},
    {'icon': Icons.motorcycle, 'title': 'Motorcycles', 'count': '567'},
    {'icon': Icons.local_shipping, 'title': 'Trucks', 'count': '89'},
    {'icon': Icons.construction, 'title': 'Parts', 'count': '2,345'},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    
    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black87),
        onPressed: () => Get.back(),
      ),
      title: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search cars, brands, models...',
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search_rounded, color: Colors.grey[500]),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear_rounded, color: Colors.grey[500]),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
          onChanged: (value) {
            setState(() {});
          },
          onSubmitted: (value) {
            _performSearch(value);
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: _searchController.text.isEmpty
                ? _buildSearchSuggestions()
                : _buildSearchResults(),
          ),
        );
      },
    );
  }

  Widget _buildSearchSuggestions() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Searches
          if (_recentSearches.isNotEmpty) ...[
            _buildSectionHeader('Recent Searches'),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _recentSearches.map((search) {
                return _buildChip(search, Icons.history_rounded);
              }).toList(),
            ),
            SizedBox(height: 24),
          ],

          // Popular Categories
          _buildSectionHeader('Browse Categories'),
          SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.6,
            ),
            itemCount: _searchCategories.length,
            itemBuilder: (context, index) {
              final category = _searchCategories[index];
              return _buildCategoryCard(category);
            },
          ),
          SizedBox(height: 24),

          // Popular Searches
          _buildSectionHeader('Popular Searches'),
          SizedBox(height: 12),
          Column(
            children: _popularSearches.map((search) {
              return _buildSearchSuggestionItem(search);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    // This would be replaced with actual search results from your API
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 64,
            color: Colors.grey[300],
          ),
          SizedBox(height: 16),
          Text(
            'No results found for "${_searchController.text}"',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try different keywords or filters',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildChip(String text, IconData icon) {
    return GestureDetector(
      onTap: () {
        _searchController.text = text;
        _performSearch(text);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.grey[600]),
            SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () {
        _searchController.text = category['title'];
        _performSearch(category['title']);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey[100]!),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorGlobalVariables.blueColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  category['icon'],
                  color: ColorGlobalVariables.blueColor,
                  size: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category['title'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${category['count']} items',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSuggestionItem(String search) {
    return ListTile(
      leading: Icon(Icons.trending_up_rounded, color: Colors.grey[500], size: 20),
      title: Text(
        search,
        style: TextStyle(color: Colors.grey[700]),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey[400]),
      onTap: () {
        _searchController.text = search;
        _performSearch(search);
      },
      contentPadding: EdgeInsets.symmetric(horizontal: 4),
    );
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) return;
    
    // Add to recent searches if not already present
    if (!_recentSearches.contains(query)) {
      setState(() {
        _recentSearches.insert(0, query);
        if (_recentSearches.length > 5) {
          _recentSearches.removeLast();
        }
      });
    }

    // Here you would typically call your search API
    print('Searching for: $query');
    
    // Show loading state and fetch results
    setState(() {});
    
    // Simulate API call
    Future.delayed(Duration(milliseconds: 500), () {
      // Update with actual search results
    });
  }
}