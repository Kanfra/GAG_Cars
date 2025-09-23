import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Screens/webViewPaymentPage.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Services/PaystackService/paystackService.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class PromotionsPage extends StatefulWidget {
  final Map<String, dynamic> allJson;

  const PromotionsPage({
    super.key,
    required this.allJson,
  });

  @override
  State<PromotionsPage> createState() => _PromotionsPageState();
}

class _PromotionsPageState extends State<PromotionsPage> {
  final Logger _logger = Logger();
  bool _isProcessing = false;
  int? _selectedIndex;
  final PageController _pageController = PageController(viewportFraction: 0.85);

  late final Map<String, dynamic> listing;

  // Premium promotion packages
  final List<Map<String, dynamic>> promotions = [
    {
      "id": "basic",
      "startText": "7 Days",
      "endText": "GH₵ 50",
      "price": 50.00,
      "durationDays": 7,
      "name": "Basic Boost",
      "description": "Perfect for getting started and testing the waters",
      "icon": FeatherIcons.star,
      "color": Colors.blue,
      "gradient": [Color(0xFF4364F7), Color(0xFF6FB1FC)],
      "features": [
        "Standard listing visibility",
        "7 days promotion duration",
        "Basic performance analytics",
        "Email support"
      ],
      "popular": false,
    },
    {
      "id": "premium",
      "startText": "14 Days",
      "endText": "GH₵ 90",
      "price": 90.00,
      "durationDays": 14,
      "name": "Premium Package",
      "description": "Maximum visibility for serious sellers",
      "icon": FeatherIcons.award,
      "color": Colors.purple,
      "gradient": [Color(0xFF9C27B0), Color(0xFFE040FB)],
      "features": [
        "Top placement in search results",
        "14 days premium promotion",
        "Premium seller badge",
        "Detailed analytics dashboard",
        "Priority email & chat support",
        "2x more buyer inquiries"
      ],
      "popular": true,
    },
    {
      "id": "vip",
      "startText": "30 Days",
      "endText": "GH₵ 200",
      "price": 200.00,
      "durationDays": 30,
      "name": "VIP Elite",
      "description": "Ultimate exposure for maximum results",
      "icon": FontAwesomeIcons.crown,
      "color": Colors.orange,
      "gradient": [Color(0xFFFF7E5F), Color(0xFFFEB47B)],
      "features": [
        "Featured listing placement",
        "30 days VIP promotion",
        "Exclusive VIP badge",
        "Advanced analytics with insights",
        "24/7 priority support",
        "Social media promotion",
        "5x more buyer inquiries",
        "Dedicated account manager"
      ],
      "popular": false,
    }
  ];

  Future<void> _handlePromotionSelection(int index) async {
    if (_isProcessing) return;

    final promotion = promotions[index];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    if (user == null) {
      Get.snackbar(
        '🔐 Login Required',
        'Please login to promote your listing',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
      _isProcessing = true;
    });

    try {
      final reference = LegacyPaystackService.generateReference();
      _logger.i('Initializing payment for: ${promotion['name']}');

      final result = await LegacyPaystackService.initializeTransaction(
        context: context,
        amount: promotion['price'],
        reference: reference,
        packageId: promotion['id'],
        packageName: promotion['name'],
        listingId: listing['id']?.toString() ?? 'unknown_id', // NULL SAFETY
        listingName: listing['name']?.toString() ?? 'Unknown Listing', // NULL SAFETY
        durationDays: promotion['durationDays'],
      );

      if (result['status'] == true) {
        final authorizationUrl = result['data']['authorization_url'];
        
        // FIXED: Pass data in the correct structure for WebViewPaymentPage
        final paymentData = {
          'authorizationUrl': authorizationUrl,
          'reference': reference,
          'amount': promotion['price'],
          'packageName': promotion['name'],
          'listingName': listing['name']?.toString() ?? 'Unknown Listing', // NULL SAFETY
          'listingId': listing['id']?.toString() ?? 'unknown_id', // NULL SAFETY
          'packageId': promotion['id'],
          'durationDays': promotion['durationDays'],
        };
        
        _logger.i('Passing payment data to WebView: $paymentData');
        
        Get.toNamed(
          RouteClass.getWebViewPaymentPage(),
          arguments: paymentData, // Directly pass the map, not nested
        );
      }
    } catch (e) {
      _logger.e('Payment error: $e');
      Get.snackbar(
        '💳 Payment Error',
        'Failed to process payment. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _selectedIndex = null;
        });
      }
    }
  }

  void _showPromotionDetails(int index) {
    final promotion = promotions[index];
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildPromotionDetailsSheet(promotion, index),
    );
  }

  Widget _buildPromotionDetailsSheet(Map<String, dynamic> promotion, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Header
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: promotion['gradient'],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(promotion['icon'], color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        promotion['name'],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        promotion['description'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Price & Duration
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: (promotion['gradient'] as List<Color>)[0].withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: (promotion['gradient'] as List<Color>)[0].withOpacity(0.3)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDetailItem(Icons.calendar_today, promotion['startText']),
                  _buildDetailItem(Icons.attach_money, promotion['endText']),
                  _buildDetailItem(Icons.trending_up, '${(promotion['price'] / 50).round()}x Visibility'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Features
            const Text(
              'What\'s Included:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            ...(promotion['features'] as List<String>).map<Widget>((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, size: 20, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
            const SizedBox(height: 32),

            // Action Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  _handlePromotionSelection(index);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (promotion['gradient'] as List<Color>)[0],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  shadowColor: (promotion['gradient'] as List<Color>)[0].withOpacity(0.3),
                ),
                child: const Text(
                  'Select This Package',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildPromotionCard(Map<String, dynamic> promotion, int index) {
    final isSelected = _selectedIndex == index;
    final gradientColors = promotion['gradient'] as List<Color>;

    return GestureDetector(
      onTap: () => _showPromotionDetails(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Stack(
          children: [
            // Main Card
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: gradientColors[0].withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: gradientColors[0].withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(promotion['icon'], size: 20, color: gradientColors[0]),
                        ),
                        if (promotion['popular'] == true)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'MOST POPULAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Title
                    Text(
                      promotion['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Description
                    Text(
                      promotion['description'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),

                    // Price & Duration
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Duration',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              promotion['startText'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              promotion['endText'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: gradientColors[0],
                              ),
                            ),
                          ],
                        ),
                      ], 
                    ),
                    const SizedBox(height: 16),

                    // Features Preview
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        ...(promotion['features'] as List<String>).take(2).map((feature) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: gradientColors[0].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            feature.split(' ').take(2).join(' '),
                            style: TextStyle(
                              fontSize: 10,
                              color: gradientColors[0],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )).toList(),
                        if ((promotion['features'] as List<String>).length > 2)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '+${(promotion['features'] as List<String>).length - 2} more',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Selection Overlay
            if (isSelected)
              Container(
                decoration: BoxDecoration(
                  color: gradientColors[0].withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: _isProcessing
                      ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white))
                      : const Icon(Icons.check_circle, size: 40, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    listing = widget.allJson['listing'] ?? {}; // NULL SAFETY
    _logger.w('Listing at promotion page: $listing');
    _logger.w('Listing id: ${listing['id']}, Listing name: ${listing['name']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: Column(
        children: [
          // Custom App Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, size: 20, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Boost Your Listing",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "${listing['name'] ?? 'Unknown Listing'} Listing", // NULL SAFETY
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.help_outline, size: 20, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose Your Boost",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Select a promotion package to increase visibility and get more buyers for your listing",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Promotion Cards
                  SizedBox(
                    height: 500,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: promotions.length,
                      itemBuilder: (context, index) => _buildPromotionCard(promotions[index], index),
                      padEnds: false,
                      pageSnapping: true,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Indicators
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(promotions.length, (index) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _pageController.hasClients && 
                                  (_pageController.page?.round() == index || 
                                   _pageController.page == index)
                                ? Colors.blue
                                : Colors.grey[300],
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Info Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.security, size: 20, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              "Secure Payment",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.support_agent, size: 20, color: Colors.blue),
                            SizedBox(width: 8),
                            Text(
                              "24/7 Support",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(Icons.refresh, size: 20, color: Colors.orange),
                            SizedBox(width: 8),
                            Text(
                              "Money-Back Guarantee",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}