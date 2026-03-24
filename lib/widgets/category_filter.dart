import 'package:flutter/material.dart';

/// Horizontal scrollable row of filter chips.
///
/// STATELESS - receives the selected category and a callback.
/// The parent screen owns the state of which category is active.
///
/// Curate.ai teams: think of these as your beverage type filters
/// (Coffee, Tea, Matcha, etc.)
/// GrubAble teams: these could be dietary restriction tags
/// (Gluten-Free, Vegan, Nut-Free, etc.)
class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return FilterChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (_) => onCategorySelected(category),
            selectedColor: Colors.deepPurple.shade100,
            checkmarkColor: Colors.deepPurple,
            labelStyle: TextStyle(
              color: isSelected ? Colors.deepPurple : Colors.grey.shade700,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            side: BorderSide(
              color: isSelected ? Colors.deepPurple : Colors.grey.shade300,
            ),
          );
        },
      ),
    );
  }
}
