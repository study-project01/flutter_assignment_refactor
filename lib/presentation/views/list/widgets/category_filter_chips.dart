import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_assignment/core/utils/responsive.dart';
import '../../../../presentation/providers/board_selectors.dart';

class CategoryFilterChips extends ConsumerWidget {
  const CategoryFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWide = Breakpoints.isTablet(context) || Breakpoints.isDesktop(context);
    final chips = [
      _CategoryChip(value: 'ALL', label: '전체'),
      const SizedBox(width: 8),
      _CategoryChip(value: 'NOTICE', label: '공지'),
      const SizedBox(width: 8),
      _CategoryChip(value: 'FREE', label: '자유'),
      const SizedBox(width: 8),
      _CategoryChip(value: 'QNA', label: 'Q&A'),
      const SizedBox(width: 8),
      _CategoryChip(value: 'ETC', label: '기타'),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isWide ? 16 : 12,
        horizontal: isWide ? 24 : 0,
      ),
      color: Colors.white,
      child: isWide
          ? Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: Breakpoints.contentMaxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: chips,
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: chips),
            ),
    );
  }
}

class _CategoryChip extends ConsumerWidget {
  final String value;
  final String label;

  const _CategoryChip({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(boardCategoryFilterProvider) == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        ref.read(boardCategoryFilterProvider.notifier).state = value;
      },
      backgroundColor: Colors.grey.shade100,
      selectedColor: Theme.of(context).primaryColor.withValues(alpha: 0.2),
      labelStyle: TextStyle(
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey.shade700,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
        fontSize: _isWide(context) ? 14 : 13,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: _isWide(context) ? 16 : 12,
        vertical: _isWide(context) ? 10 : 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          width: 1.5,
        ),
      ),
    );
  }

  bool _isWide(BuildContext context) =>
      Breakpoints.isTablet(context) || Breakpoints.isDesktop(context);
}
