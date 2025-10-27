import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gag_cars_frontend/Routes/routeClass.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart'; // Add GetX for navigation

// Add your chat page import here
// import 'package:gag_cars_frontend/Pages/ChatPages/chat_page.dart';

class ContactUsService {
  // Configuration - Replace these with your actual details
  static const String _customerServicePhone = '+233552058759';
  static const String _whatsappNumber = '233530183887';
  static const String _websiteUrl = 'https://www.gagcars.com';
  static const String _facebookPageId = 'gagcars'; // Or numeric ID
  static const String _twitterHandle = 'gagcars';
  static const String _instagramUsername = 'gagcars';

  // Contact options data model
  static List<ContactOption> get contactOptions => [
    ContactOption(
      title: 'Customer Service',
      icon: Icons.headset_mic_outlined,
      color: Colors.blue,
      action: navigateToChatPage, // Changed to navigation function
    ),
    ContactOption(
      title: 'WhatsApp',
      icon: FontAwesomeIcons.whatsapp,
      color: Colors.green,
      action: launchWhatsApp,
    ),
    ContactOption(
      title: 'Website',
      icon: FontAwesomeIcons.globe,
      color: Colors.blueAccent,
      action: launchWebsite,
    ),
    ContactOption(
      title: 'Facebook',
      icon: FontAwesomeIcons.facebook,
      color: const Color(0xFF1877F2),
      action: launchFacebook,
    ),
    ContactOption(
      title: 'Twitter',
      icon: FontAwesomeIcons.twitter,
      color: const Color(0xFF1DA1F2),
      action: launchTwitter,
    ),
    ContactOption(
      title: 'Instagram',
      icon: FontAwesomeIcons.instagram,
      color: const Color(0xFFE4405F),
      action: launchInstagram,
    ),
  ];

  // Navigation function to chat page
  static Future<void> navigateToChatPage(BuildContext context) async {
    try {
      // Option 1: Using GetX navigation (if you're using GetX)
      Get.offAllNamed(
        RouteClass.getChatPage()
      ); // Uncomment and replace with your actual chat page
      
      // Option 2: Using Navigator (standard Flutter)
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ChatPage()),
      // );
      
      // Option 3: Using named routes (if you have routes set up)
      // Get.toNamed('/chat-page');
      // or
      // Navigator.pushNamed(context, '/chat-page');
      
      // For now, showing a placeholder message
      _showInfo(context, 'Opening customer service chat...');
      
      // TODO: Replace the above line with your actual navigation code
      print('Navigate to chat page - Implement your navigation logic here');
      
    } catch (e) {
      final logger = Logger();
      logger.e('Error navigating to chat page', error: e);
      _showError(context, 'Failed to open chat');
    }
  }

  static Future<void> launchWhatsApp(BuildContext context) async {
    final logger = Logger();
    try {
      // Try both URL formats
      final url1 = Uri.parse('https://wa.me/$_whatsappNumber');
      final url2 = Uri.parse('whatsapp://send?phone=$_whatsappNumber');
      
      if (await canLaunchUrl(url1)) {
        await launchUrl(url1, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(url2)) {
        await launchUrl(url2, mode: LaunchMode.externalApplication);
      } else {
        _showError(context, 'WhatsApp not installed');
      }
    } catch (e) {
      logger.e('WhatsApp launch error', error: e);
      _showError(context, 'Error opening WhatsApp');
    }
  }

  static Future<void> launchWebsite(BuildContext context) async {
    try {
      final url = Uri.parse(_websiteUrl);
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView, // Opens in-app browser
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );
    } catch (e) {
      _showError(context, 'Could not open website');
    }
  }

  static Future<void> launchFacebook(BuildContext context) async {
    try {
      // Try native app first
      final appUrl = Uri.parse('fb://page/$_facebookPageId');
      final webUrl = Uri.parse('https://www.facebook.com/$_facebookPageId');
      
      if (await canLaunchUrl(appUrl)) {
        await launchUrl(appUrl);
      } else {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      _showError(context, 'Could not open Facebook');
    }
  }

  static Future<void> launchTwitter(BuildContext context) async {
    try {
      // Try native app first
      final appUrl = Uri.parse('twitter://user?screen_name=$_twitterHandle');
      final webUrl = Uri.parse('https://twitter.com/$_twitterHandle');
      
      if (await canLaunchUrl(appUrl)) {
        await launchUrl(appUrl);
      } else {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      _showError(context, 'Could not open Twitter');
    }
  }

  static Future<void> launchInstagram(BuildContext context) async {
    try {
      // Try native app first
      final appUrl = Uri.parse('instagram://user?username=$_instagramUsername');
      final webUrl = Uri.parse('https://instagram.com/$_instagramUsername');
      
      if (await canLaunchUrl(appUrl)) {
        await launchUrl(appUrl);
      } else {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      _showError(context, 'Could not open Instagram');
    }
  }

  static void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void _showInfo(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class ContactOption {
  final String title;
  final IconData icon;
  final Color color;
  final Future<void> Function(BuildContext context) action;

  const ContactOption({
    required this.title,
    required this.icon,
    required this.color,
    required this.action,
  });
}