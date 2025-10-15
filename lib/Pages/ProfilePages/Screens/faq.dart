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
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      body: Consumer<FaqProvider>(
        builder: (context, faqProvider, child) {
          if (faqProvider.isLoading && faqProvider.categories.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorGlobalVariables.brownColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Loading FAQs...'),
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
                  SizedBox(height: 16),
                  Text(
                    'Error: ${faqProvider.error}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: faqProvider.retry,
                    child: Text('Retry'),
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
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No FAQs available',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: faqProvider.retry,
                    child: Text('Reload'),
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
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : theme.textTheme.bodyLarge?.color,
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
                          color: isDarkMode ? Colors.grey[800] : Colors.white,
                          child: ExpansionTile(
                            initiallyExpanded: _isExpanded(index),
                            onExpansionChanged: (_) => _toggleExpansion(index),
                            tilePadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                            title: Text(
                              faq['question'],
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: Icon(
                              _isExpanded(index)
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: theme.primaryColor,
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: Text(
                                  faq['answer'],
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: isDarkMode 
                                        ? Colors.grey[300] 
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