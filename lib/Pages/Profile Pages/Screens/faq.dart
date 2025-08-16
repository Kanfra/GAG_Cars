import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  int selectedCategoryIndex = 0;
  final List<int> _expandedQuestionIndices = [];

  final List<String> categories = ["General", "Account", "Payment"];
  
  final Map<String, List<Map<String, String>>> faqs = {
    "General": [
      {
        "question": "What is GAG Cars?",
        "answer": "GAG Cars is a premium vehicle marketplace connecting buyers and sellers of quality automobiles. We provide a seamless platform to browse, compare, and purchase vehicles with confidence."
      },
      {
        "question": "How to use GAG Cars app?",
        "answer": "Simply download the app, create an account, and start browsing vehicles. You can save favorites, compare models, and contact sellers directly through our secure messaging system."
      },
      {
        "question": "Is GAG Cars available in my country?",
        "answer": "We currently operate in multiple countries across Africa. Check our website for the most up-to-date list of supported regions."
      }
    ],
    "Account": [
      {
        "question": "How do I create an account?",
        "answer": "Tap the 'Sign Up' button and follow the prompts. You'll need a valid email address or phone number to verify your account."
      },
      {
        "question": "How do I reset my password?",
        "answer": "On the login screen, tap 'Forgot Password' and follow the instructions sent to your registered email."
      }
    ],
    "Payment": [
      {
        "question": "What payment methods do you accept?",
        "answer": "We accept all major credit cards, bank transfers, and several mobile payment options depending on your region."
      },
      {
        "question": "Is my payment information secure?",
        "answer": "Absolutely. We use industry-standard encryption and never store your full payment details on our servers."
      }
    ]
  };

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
    final currentFaqs = faqs[categories[selectedCategoryIndex]]!;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      body: CustomScrollView(
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
                  children: List.generate(categories.length, (index) {
                    final isSelected = selectedCategoryIndex == index;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ChoiceChip(
                        label: Text(categories[index]),
                        selected: isSelected,
                        onSelected: (_) {
                          setState(() {
                            selectedCategoryIndex = index;
                            _expandedQuestionIndices.clear();
                          });
                        },
                        selectedColor: theme.primaryColor,
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
                          faq["question"]!,
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
                              faq["answer"]!,
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
      ),
    );
  }
}