import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';
import 'package:gag_cars_frontend/Pages/Authentication/Providers/userProvider.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Models/packageModel.dart';
import 'package:gag_cars_frontend/Pages/PaymentPage/Providers/packageProvider.dart';
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

  // Color schemes for different package tiers
  final List<Map<String, dynamic>> _colorSchemes = [
    {
      'gradient': [Color(0xFF6366F1), Color(0xFF8B5CF6)],
      'icon': FeatherIcons.star,
      'iconColor': Colors.amber,
    },
    {
      'gradient': [Color(0xFF059669), Color(0xFF10B981)],
      'icon': FeatherIcons.award,
      'iconColor': Colors.teal,
    },
    {
      'gradient': [Color(0xFFDC2626), Color(0xFFEA580C)],
      'icon': FontAwesomeIcons.crown,
      'iconColor': Colors.orange,
    },
    {
      'gradient': [Color(0xFF7C3AED), Color(0xFFC026D3)],
      'icon': FeatherIcons.trendingUp,
      'iconColor': Colors.purple,
    },
    {
      'gradient': [Color(0xFF0EA5E9), Color(0xFF06B6D4)],
      'icon': FeatherIcons.zap,
      'iconColor': Colors.blue,
    },
    {
      'gradient': [Color(0xFFF59E0B), Color(0xFFD97706)],
      'icon': Icons.diamond_outlined,
      'iconColor': Colors.yellow,
    },
  ];

  Map<String, dynamic> _getColorScheme(int index) {
    return _colorSchemes[index % _colorSchemes.length];
  }

  Map<String, dynamic> _convertToUIPackage(Package package, int index) {
    final colorScheme = _getColorScheme(index);
    final price = double.tryParse(package.price) ?? 0.0;
    
    bool isPopular = index == 1;
    String description = package.description ?? 'Boost your listing visibility';
    
    List<String> features = [
      '${package.numberOfListings} listing${package.numberOfListings > 1 ? 's' : ''}',
      'Premium visibility',
      '24/7 customer support',
    ];
    
    if (package.numberOfListings > 1) {
      features.add('Multiple listing support');
    }
    
    if (price > 50) {
      features.add('Priority placement');
      features.add('Enhanced analytics');
    }
    
    if (price > 100) {
      features.add('Featured listing');
      features.add('Social media promotion');
    }

    return {
      "id": package.id,
      "startText": "${package.promotionDays ?? 7} Days",
      "endText": "GH₵ ${package.price}",
      "price": price,
      "durationDays": package.promotionDays ?? 7,
      "name": package.name,
      "description": description,
      "icon": colorScheme['icon'],
      "color": colorScheme['iconColor'],
      "gradient": colorScheme['gradient'],
      "features": features,
      "popular": isPopular,
    };
  }

  Future<void> _handlePromotionSelection(int index, List<Map<String, dynamic>> uiPackages) async {
    if (_isProcessing) return;

    final promotion = uiPackages[index];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.user;

    if (user == null) {
      Get.snackbar(
        'Login Required',
        'Please login to promote your listing',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
      _isProcessing = true;
    });

    try {
      final reference = LegacyPaystackService.generateReference();
      
      final result = await LegacyPaystackService.initializeTransaction(
        context: context,
        amount: promotion['price'],
        reference: reference,
        packageId: promotion['id'],
        packageName: promotion['name'],
        listingId: listing['id']?.toString() ?? 'unknown_id',
        listingName: listing['name']?.toString() ?? 'Unknown Listing',
        durationDays: promotion['durationDays'],
      );

      if (result['status'] == true) {
        final authorizationUrl = result['data']['authorization_url'];
        
        final paymentData = {
          'authorizationUrl': authorizationUrl,
          'reference': reference,
          'amount': promotion['price'],
          'packageName': promotion['name'],
          'listingName': listing['name']?.toString() ?? 'Unknown Listing',
          'listingId': listing['id']?.toString() ?? 'unknown_id',
          'packageId': promotion['id'],
          'durationDays': promotion['durationDays'],
        };
        
        Get.toNamed(
          RouteClass.getWebViewPaymentPage(),
          arguments: paymentData,
        );
      }
    } catch (e) {
      _logger.e('Payment error: $e');
      Get.snackbar(
        'Payment Error',
        'Failed to process payment. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
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

  void _showPromotionDetails(int index, List<Map<String, dynamic>> uiPackages) {
    final promotion = uiPackages[index];
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildPromotionDetailsSheet(promotion, index, uiPackages),
    );
  }

  Widget _buildPromotionDetailsSheet(Map<String, dynamic> promotion, int index, List<Map<String, dynamic>> uiPackages) {
    // FIXED: Safe way to get listing feature
    final listingFeature = promotion['features'].firstWhere(
      (f) => f.toString().toLowerCase().contains('listing'),
      orElse: () => '${promotion['features'].length} features',
    );

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
                  _buildDetailItem(Icons.list_alt, listingFeature.toString()), // FIXED: Use safe value
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'What\'s Included:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            ...(promotion['features'] as List<dynamic>).map<Widget>((feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, size: 20, color: Colors.green),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      feature.toString(),
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

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  _handlePromotionSelection(index, uiPackages);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (promotion['gradient'] as List<Color>)[0],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
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
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPromotionCard(Map<String, dynamic> promotion, int index, List<Map<String, dynamic>> uiPackages) {
    final isSelected = _selectedIndex == index;
    final gradientColors = promotion['gradient'] as List<Color>;

    return GestureDetector(
      onTap: () => _showPromotionDetails(index, uiPackages),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Stack(
          children: [
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
                              'POPULAR',
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

                    Text(
                      promotion['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),

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

                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        ...(promotion['features'] as List<dynamic>).take(2).map((feature) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: gradientColors[0].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            feature.toString().length > 15 ? '${feature.toString().substring(0, 15)}...' : feature.toString(),
                            style: TextStyle(
                              fontSize: 10,
                              color: gradientColors[0],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )).toList(),
                        if ((promotion['features'] as List<dynamic>).length > 2)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '+${(promotion['features'] as List<dynamic>).length - 2} more',
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
    listing = widget.allJson['listing'] ?? {};
    
    final userProvider = context.read<UserProvider>();
    final packageProvider = context.read<PackageProvider>();
    
    if (userProvider.user != null) {
      packageProvider.getPackages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      body: Consumer<PackageProvider>(
        builder: (context, packageProvider, child) {
          final uiPackages = packageProvider.packages
              .asMap()
              .entries
              .map((entry) => _convertToUIPackage(entry.value, entry.key))
              .toList();

          return Column(
            children: [
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
                                "${listing['name'] ?? 'Unknown Listing'} Listing",
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
                child: packageProvider.isLoading
                    ? Center(
                      child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(ColorGlobalVariables.brownColor),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Loading packages...',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                      )
                    : packageProvider.error != null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                                const SizedBox(height: 16),
                                Text(
                                  'Failed to load packages',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  packageProvider.error!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : uiPackages.isEmpty
                            ? const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.inventory_2_outlined, size: 64, color: Colors.grey),
                                    SizedBox(height: 16),
                                    Text(
                                      'No packages available',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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

                                    SizedBox(
                                      height: 500,
                                      child: PageView.builder(
                                        controller: _pageController,
                                        itemCount: uiPackages.length,
                                        itemBuilder: (context, index) => 
                                            _buildPromotionCard(uiPackages[index], index, uiPackages),
                                        padEnds: false,
                                        pageSnapping: true,
                                      ),
                                    ),
                                    const SizedBox(height: 24),

                                    Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(uiPackages.length, (index) {
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
                                  ],
                                ),
                              ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}