import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Services/ContactUsService/contactUsService.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        color: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: ContactUsService.contactOptions.length,
          itemBuilder: (context, index) {
            final option = ContactUsService.contactOptions[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => option.action(context),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(
                          option.icon,
                          size: 28,
                          color: option.color,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          option.title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}