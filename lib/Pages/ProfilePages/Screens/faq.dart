import 'package:flutter/material.dart';
import 'package:gag_cars_frontend/Pages/ProfilePages/Providers/faqProvider.dart';
import 'package:provider/provider.dart';
import 'package:gag_cars_frontend/GlobalVariables/colorGlobalVariables.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  final List<int> _expandedQuestionIndices = [];

  @override
  void initState() {
    super.initState();
    // Load FAQs when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FaqProvider>().loadFaqCategories();
    });
  }

  bool _isExpanded(int index) => _expandedQuestionIndices.contains(index);

  void _toggleExpansion(int index) {
    setState(() {
      if (_isExpanded(index)) {
        _expandedQuestionIndices.remove(index);
      } else {
        _expandedQuestionIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF303030) : Colors.grey[50],
      body: Consumer<FaqProvider>(
        builder: (context, faqProvider, child) {
          if (faqProvider.isLoading && faqProvider.categories.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorGlobalVariables.brownColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading FAQs...',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            );
          }

          if (faqProvider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${faqProvider.error}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: faqProvider.retry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorGlobalVariables.brownColor,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (faqProvider.categories.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.help_outline,
                    size: 64,
                    color: isDarkMode ? Colors.grey[500] : Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No FAQs available',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: faqProvider.retry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorGlobalVariables.brownColor,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Reload'),
                  ),
                ],
              ),
            );
          }

          final currentFaqs = faqProvider.currentCategoryFaqs;

          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Frequently Asked Questions',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                sliver: SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(faqProvider.categoryNames.length, (index) {
                        final isSelected = faqProvider.selectedCategoryIndex == index;
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: ChoiceChip(
                            label: Text(faqProvider.categoryNames[index]),
                            checkmarkColor: ColorGlobalVariables.whiteColor,
                            selected: isSelected,
                            onSelected: (_) {
                              faqProvider.selectCategory(index);
                              _expandedQuestionIndices.clear();
                            },
                            selectedColor: ColorGlobalVariables.brownColor,
                            backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                            labelStyle: TextStyle(
                              color: isSelected 
                                ? Colors.white 
                                : (isDarkMode ? Colors.white70 : theme.textTheme.bodyLarge?.color),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final faq = currentFaqs[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: isDarkMode ? const Color(0xFF424242) : Colors.white,
                          child: ExpansionTile(
                            initiallyExpanded: _isExpanded(index),
                            onExpansionChanged: (_) => _toggleExpansion(index),
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                            title: Text(
                              faq['question'],
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            trailing: Icon(
                              _isExpanded(index)
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: isDarkMode ? Colors.white70 : ColorGlobalVariables.brownColor,
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: Text(
                                  faq['answer'],
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: isDarkMode 
                                        ? Colors.white70 
                                        : Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: currentFaqs.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}