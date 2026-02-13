import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsService {
  // Configuration - Replace these with your actual details
  static const String _customerServicePhone = '+233530183887';
  static const String _customerServiceName = 'Gag Cars Customer Service';
  static const String _whatsappNumber = '233530183887';
  static const String _websiteUrl = 'https://www.gagcars.com';
  static const String _facebookPageId = 'gagcars';
  static const String _twitterHandle = 'gagcars';
  static const String _instagramUsername = 'gagcars';

  // Contact options data model
  static List<ContactOption> get contactOptions => [
    ContactOption(
      title: 'Customer Service',
      icon: Icons.headset_mic_outlined,
      color: Colors.blue,
      action: makeCustomerServiceCall,
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

  // Make a call to customer service - opens phone dialer with number pre-filled
  static Future<void> makeCustomerServiceCall(BuildContext context) async {
    final logger = Logger();

    logger.i(
      'Make customer service call button pressed for phone: $_customerServicePhone',
    );

    if (_customerServicePhone.isEmpty) {
      _showError(context, 'Customer service phone number not available');
      return;
    }

    // Clean the phone number - remove any non-digit characters except +
    final cleanPhoneNumber = _customerServicePhone.replaceAll(
      RegExp(r'[^\d+]'),
      '',
    );

    if (cleanPhoneNumber.isEmpty) {
      _showError(context, 'Invalid customer service phone number format');
      return;
    }

    final phoneUrl = 'tel:$cleanPhoneNumber';

    try {
      logger.i('Launching phone dialer with URL: $phoneUrl');

      if (await canLaunchUrl(Uri.parse(phoneUrl))) {
        await launchUrl(Uri.parse(phoneUrl));
        logger.i('Phone dialer launched successfully for customer service');

        // Show success message
        if (!context.mounted) return;
        _showSuccess(
          context,
          'Opening phone dialer for $_customerServiceName...',
        );
      } else {
        throw 'Could not launch phone dialer';
      }
    } catch (e) {
      logger.e('Error launching phone dialer for customer service: $e');
      _showError(
        context,
        'Could not make a call. Please check if your device supports phone calls.',
      );
    }
  }

  static Future<void> launchWhatsApp(BuildContext context) async {
    final logger = Logger();
    try {
      // Clean the phone number for WhatsApp
      final cleanWhatsapp = _whatsappNumber.replaceAll(RegExp(r'[^\d]'), '');

      // Try both URL formats
      final url1 = Uri.parse('https://wa.me/$cleanWhatsapp');
      final url2 = Uri.parse('whatsapp://send?phone=$cleanWhatsapp');

      if (await canLaunchUrl(url1)) {
        await launchUrl(url1, mode: LaunchMode.externalApplication);
        if (!context.mounted) return;
        _showInfo(context, 'Opening WhatsApp...');
      } else if (await canLaunchUrl(url2)) {
        await launchUrl(url2, mode: LaunchMode.externalApplication);
        if (!context.mounted) return;
        _showInfo(context, 'Opening WhatsApp...');
      } else {
        if (!context.mounted) return;
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
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );
      if (!context.mounted) return;
      _showInfo(context, 'Opening website...');
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
        if (!context.mounted) return;
        _showInfo(context, 'Opening Facebook...');
      } else {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
        if (!context.mounted) return;
        _showInfo(context, 'Opening Facebook...');
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
        if (!context.mounted) return;
        _showInfo(context, 'Opening Twitter...');
      } else {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
        if (!context.mounted) return;
        _showInfo(context, 'Opening Twitter...');
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
        if (!context.mounted) return;
        _showInfo(context, 'Opening Instagram...');
      } else {
        await launchUrl(webUrl, mode: LaunchMode.externalApplication);
        if (!context.mounted) return;
        _showInfo(context, 'Opening Instagram...');
      }
    } catch (e) {
      _showError(context, 'Could not open Instagram');
    }
  }

  // Show contact details as fallback (optional - you can remove this if not needed)
  static void showCustomerServiceDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.headset_mic, color: Colors.blue),
            SizedBox(width: 8),
            Text('Customer Service'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact our customer service team for assistance:',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            _buildContactInfoRow(Icons.person, _customerServiceName),
            _buildContactInfoRow(Icons.phone, _customerServicePhone),
            SizedBox(height: 12),
            Text(
              'Tap the call button below to contact us directly.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.blue[700],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              makeCustomerServiceCall(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.phone, size: 16),
                SizedBox(width: 4),
                Text('Call Now'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildContactInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(fontSize: 14))),
        ],
      ),
    );
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

  static void _showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
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
