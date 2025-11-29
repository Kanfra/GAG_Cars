import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Messages/Models/chatContactModel.dart';
import 'package:gag_cars_frontend/Pages/Messages/Providers/contactsProvider.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All Messages';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterContacts);
    // Load contacts when page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadContacts();
    });
  }

  void _loadContacts() {
    final provider = context.read<ContactsProvider>();
    if (provider.contacts.isEmpty && !provider.isLoading) {
      provider.loadContacts();
    }
  }

  void _filterContacts() {
    setState(() {});
  }

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _navigateToChat(ChatContact contact) {
    Get.toNamed(
      RouteClass.getChatPage(),
      arguments: {
        'contactId': contact.id,
        'contactName': contact.name,
        'contactImage': contact.profilePhoto ?? contact.avatar,
        'contactPhone': contact.phone,
      },
    );
  }

  void _startNewChat() {
    Get.snackbar(
      'New Chat',
      'Start a new conversation feature coming soon!',
      backgroundColor: ColorGlobalVariables.brownColor,
      colorText: Colors.white,
    );
  }

  void _refreshContacts() {
    context.read<ContactsProvider>().refreshContacts();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: _buildAppBar(theme),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(theme),
          
          // Categories
          _buildCategoryTabs(theme),
          
          // Contacts List
          _buildContactsList(theme),
        ],
      ),
      
      // Floating Action Button
      // floatingActionButton: _buildFloatingActionButton(),
    );
  }

  AppBar _buildAppBar(ThemeData theme) {
    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor ?? Colors.white,
      elevation: 1,
      title: Text(
        "Messages",
        style: TextStyle(
          color: theme.appBarTheme.foregroundColor ?? ColorGlobalVariables.brownColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.refresh_rounded, color: theme.iconTheme.color ?? Colors.black54),
          onPressed: _refreshContacts,
        ),
      ],
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TextFormField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search contacts...",
            hintStyle: TextStyle(
              color: isDarkMode ? Colors.grey[400] : Colors.grey[500], 
              fontSize: 16
            ),
            prefixIcon: Icon(
              Icons.search_rounded, 
              color: isDarkMode ? Colors.grey[400] : Colors.grey[500], 
              size: 24
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded, 
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[500], 
                      size: 20
                    ),
                    onPressed: () {
                      _searchController.clear();
                      _filterContacts();
                    },
                  )
                : null,
            fillColor: theme.cardColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
          style: TextStyle(
            color: theme.textTheme.titleLarge?.color, 
            fontSize: 16
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs(ThemeData theme) {
    final categories = ['All Messages'];
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: categories.map((category) {
          return _buildCategoryItem(category, theme, isDarkMode);
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryItem(String category, ThemeData theme, bool isDarkMode) {
    final isActive = _selectedCategory == category;
    
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => _onCategorySelected(category),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: isActive ? ColorGlobalVariables.brownColor : theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isActive ? ColorGlobalVariables.brownColor : isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                width: 1.5,
              ),
              boxShadow: [
                if (!isActive)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                  color: isActive ? Colors.white : theme.textTheme.bodyMedium?.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactsList(ThemeData theme) {
    return Expanded(
      child: Consumer<ContactsProvider>(
        builder: (context, contactsProvider, child) {
          if (contactsProvider.isLoading && contactsProvider.contacts.isEmpty) {
            return _buildLoadingState(theme);
          }

          if (contactsProvider.hasError) {
            return _buildErrorState(contactsProvider.error!, theme);
          }

          final contacts = _searchController.text.isEmpty
              ? contactsProvider.contacts
              : contactsProvider.searchContacts(_searchController.text);

          final filteredContacts = _applyCategoryFilter(contacts);

          if (filteredContacts.isEmpty) {
            return _buildEmptyState(theme);
          }

          return _buildContactsListView(filteredContacts, theme);
        },
      ),
    );
  }

  List<ChatContact> _applyCategoryFilter(List<ChatContact> contacts) {
    switch (_selectedCategory) {
      case 'All Messages':
      default:
        return contacts;
    }
  }

  Widget _buildContactsListView(List<ChatContact> contacts, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          itemCount: contacts.length,
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              height: 1,
              thickness: 1,
              color: isDarkMode ? Colors.grey[700] : Colors.grey[200],
            ),
          ),
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return _buildContactTile(contact, theme);
          },
        ),
      ),
    );
  }

  Widget _buildContactTile(ChatContact contact, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigateToChat(contact),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar with Online Status
              Stack(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: contact.activeStatus == 1 ? Colors.green : isDarkMode ? Colors.grey[600]! : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: _buildUserImage(contact, theme),
                    ),
                  ),
                  if (contact.activeStatus == 1)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.cardColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              
              const SizedBox(width: 12),
              
              // Contact Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            contact.name.isNotEmpty ? contact.name : 'Unknown User',
                            style: TextStyle(
                              color: theme.textTheme.titleLarge?.color,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (contact.maxCreatedAt.isNotEmpty)
                          Text(
                            _formatTime(contact.maxCreatedAt),
                            style: TextStyle(
                              color: theme.textTheme.bodySmall?.color,
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                    
                    const SizedBox(height: 4),
                    
                    Text(
                      'Start a conversation',
                      style: TextStyle(
                        color: theme.textTheme.bodyMedium?.color,
                        fontSize: 14,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    // const SizedBox(height: 4),
                    
                    // // Phone number
                    // Text(
                    //   contact.phone.isNotEmpty ? contact.phone : 'No phone number',
                    //   style: TextStyle(
                    //     color: ColorGlobalVariables.brownColor,
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserImage(ChatContact contact, ThemeData theme) {
    final isDarkMode = theme.brightness == Brightness.dark;
    final imageUrl = contact.profilePhoto ?? contact.avatar;
    
    if (imageUrl.isNotEmpty && imageUrl.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
          child: Icon(Icons.person, color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
        ),
        errorWidget: (context, url, error) => Container(
          color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
          child: Icon(Icons.person, color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
        ),
      );
    } else {
      return Container(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        child: Icon(Icons.person, color: isDarkMode ? Colors.grey[500] : Colors.grey[400]),
      );
    }
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: ColorGlobalVariables.brownColor,
          ),
          const SizedBox(height: 16),
          Text(
            'Loading contacts...',
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 64,
            color: theme.iconTheme.color,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load contacts',
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              error.length > 100 ? '${error.substring(0, 100)}...' : error,
              style: TextStyle(
                color: theme.textTheme.bodySmall?.color,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _refreshContacts,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorGlobalVariables.brownColor,
            ),
            child: const Text(
              'Try Again',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline_rounded,
            size: 80,
            color: theme.iconTheme.color,
          ),
          const SizedBox(height: 16),
          Text(
            'No contacts found',
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              _searchController.text.isNotEmpty
                  ? 'No contacts match your search'
                  : 'Start conversations by connecting with other users',
              style: TextStyle(
                color: theme.textTheme.bodySmall?.color,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          if (_searchController.text.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                _searchController.clear();
                _filterContacts();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorGlobalVariables.brownColor,
              ),
              child: const Text(
                'Clear Search',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: ColorGlobalVariables.brownColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: _startNewChat,
      child: const Icon(Icons.edit_rounded, color: Colors.white, size: 24),
    );
  }

  String _formatTime(String timestamp) {
    if (timestamp.isEmpty) return '';
    
    try {
      final dateTime = DateTime.parse(timestamp);
      final now = DateTime.now();
      final difference = now.difference(dateTime);
      
      if (difference.inMinutes < 1) {
        return 'Now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes}m';
      } else if (difference.inHours < 24) {
        return '${difference.inHours}h';
      } else if (difference.inDays < 7) {
        return '${difference.inDays}d';
      } else {
        return '${dateTime.day}/${dateTime.month}';
      }
    } catch (e) {
      return '';
    }
  }
}