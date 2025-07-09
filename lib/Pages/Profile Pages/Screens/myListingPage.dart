import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:get/get.dart';
import '../../../GeneralComponents/EdemComponents/Appbar/customAppbarOne.dart';

class MyListingPage extends StatefulWidget {
  const MyListingPage({super.key});

  @override
  State<MyListingPage> createState() => _MyListingPageState();
}

class _MyListingPageState extends State<MyListingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_updateTabIndicator);
  }

  void _updateTabIndicator() {
    // Force rebuild when tab changes (either by tap or swipe)
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.removeListener(_updateTabIndicator);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: CustomAppbar(
          onLeadingIconClickFunction: () => Get.back(),
          isLeadingWidgetExist: true,
          leadingIconData: Icons.arrow_back_ios_new_outlined,
          titleText: "My Listings",
          centerTitle: true,
          titleTextColor: ColorGlobalVariables.redColor,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Badge(
                smallSize: 8,
                child: const Icon(Icons.notifications_none_outlined),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            // Custom Tab Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 70,
              child: Row(
                children: [
                  _buildTabButton("Live", 0),
                  const SizedBox(width: 20),
                  _buildTabButton("Sold", 1),
                ],
              ),
            ),
            
            // Tab content
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  // This ensures indicators update during swipe gestures
                  if (notification is ScrollUpdateNotification) {
                    setState(() {});
                  }
                  return false;
                },
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Live(),
                    Sold(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    final isSelected = _tabController.index == index;
    
    return Expanded(
      child: GestureDetector(
        onTap: () => _tabController.animateTo(index),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? ColorGlobalVariables.redColor : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.black : Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              if (isSelected)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: ColorGlobalVariables.redColor,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Live extends StatelessWidget {
  const Live({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - using NetworkImage as fallback
    final liveListings = List.generate(10, (index) => {
      'title': 'Car Model ${index + 1}',
      'price': '\$${(15000 + (index * 2500)).toStringAsFixed(0)}',
      'image': 'https://source.unsplash.com/random/300x200/?car,${index + 1}',
      'views': '${120 + index * 15} views',
      'time': '${index + 1} ${index == 0 ? 'day' : 'days'} ago',
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),
        itemCount: liveListings.length,
        itemBuilder: (context, index) {
          final item = liveListings[index];
          return _buildListingCard(
            context,
            title: item['title']!,
            price: item['price']!,
            imageUrl: item['image']!,
            views: item['views']!,
            time: item['time']!,
            isSold: false,
          );
        },
      ),
    );
  }
}

class Sold extends StatelessWidget {
  const Sold({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - using NetworkImage as fallback
    final soldListings = List.generate(8, (index) => {
      'title': 'Car Model ${index + 1}',
      'price': '\$${(12000 + (index * 2000)).toStringAsFixed(0)}',
      'imageUrl': 'https://source.unsplash.com/random/300x200/?car,sold,${index + 1}',
      'soldDate': '${index + 1} ${index == 0 ? 'week' : 'weeks'} ago',
      'buyer': 'Buyer ${index + 1}',
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),
        itemCount: soldListings.length,
        itemBuilder: (context, index) {
          final item = soldListings[index];
          return _buildListingCard(
            context,
            title: item['title']!,
            price: item['price']!,
            imageUrl: item['imageUrl']!,
            soldDate: item['soldDate']!,
            buyer: item['buyer']!,
            isSold: true,
          );
        },
      ),
    );
  }
}

Widget _buildListingCard(
  BuildContext context, {
  required String title,
  required String price,
  required String imageUrl,
  String? views,
  String? time,
  String? soldDate,
  String? buyer,
  required bool isSold,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image with status badge
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Icon(Icons.car_repair, size: 40, color: Colors.grey),
                  );
                },
              ),
            ),
            if (isSold)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'SOLD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSold ? Colors.grey[600] : ColorGlobalVariables.redColor,
                ),
              ),
              const SizedBox(height: 8),
              
              if (!isSold)
                Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined, size: 14, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      views!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      time!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              
              if (isSold)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sold $soldDate',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'To: $buyer',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    ),
  );
}