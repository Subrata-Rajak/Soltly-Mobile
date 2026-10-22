import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_spacing.dart';
import '../../../app/theme/app_typography.dart';
import '../../home/data/mock_home_data.dart';
import '../../home/presentation/widgets/service_card.dart';
import '../domain/service_models.dart';

/// Full interactive Explore & Service Discovery catalogue for Slotly.
/// Polished with modern typography, pill filters, smooth scrolling, and accessible sheets.
class ExploreScreen extends StatefulWidget {
  final String? initialCategoryId;
  final String? initialQuery;

  const ExploreScreen({super.key, this.initialCategoryId, this.initialQuery});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late final TextEditingController _searchController;
  late String _selectedCategoryId;
  ServiceSortOption _selectedSort = ServiceSortOption.recommended;
  double? _maxPriceFilter;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery ?? '');
    _selectedCategoryId = widget.initialCategoryId ?? 'all';
  }

  @override
  void didUpdateWidget(ExploreScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCategoryId != oldWidget.initialCategoryId &&
        widget.initialCategoryId != null) {
      setState(() {
        _selectedCategoryId = widget.initialCategoryId!;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool get _hasActiveFilters =>
      _searchController.text.trim().isNotEmpty ||
      _selectedCategoryId != 'all' ||
      _maxPriceFilter != null ||
      _selectedSort != ServiceSortOption.recommended;

  void _clearAllFilters() {
    setState(() {
      _searchController.clear();
      _selectedCategoryId = 'all';
      _maxPriceFilter = null;
      _selectedSort = ServiceSortOption.recommended;
    });
  }

  List<ServiceItem> get _filteredServices {
    return MockHomeData.filterServices(
      query: _searchController.text,
      categoryId: _selectedCategoryId,
      maxPrice: _maxPriceFilter,
      sortOption: _selectedSort,
    );
  }

  @override
  Widget build(BuildContext context) {
    final services = _filteredServices;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: const Text('Explore Services'),
        actions: [
          if (_hasActiveFilters)
            TextButton(onPressed: _clearAllFilters, child: const Text('Reset')),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Input Field
            _buildSearchInput(),

            // Horizontal Category Filter Strip
            _buildCategoryFilterStrip(),
            const SizedBox(height: AppSpacing.xs),

            // Controls Bar: Sort, Price Filter & Results Counter
            _buildControlsBar(services.length),

            // Active Filter Chips Row (when filters are active)
            if (_hasActiveFilters) _buildActiveFilterChips(),

            const SizedBox(height: AppSpacing.xs),

            // Results List or Intentional Empty State
            Expanded(
              child: services.isEmpty
                  ? _buildEmptyResultsState()
                  : _buildServicesList(services),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xs,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowSubtle,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (_) => setState(() {}),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search service name, keywords, tasks...',
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textMuted,
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColors.primary,
              size: 22,
            ),
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear_rounded, size: 20),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 13,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilterStrip() {
    final categories = MockHomeData.categories;

    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            final isSelected = _selectedCategoryId == 'all';
            return ChoiceChip(
              label: Text(
                'All (${MockHomeData.allServices.length})',
                style: AppTypography.labelSmall.copyWith(
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              selected: isSelected,
              selectedColor: AppColors.primary,
              backgroundColor: Colors.white,
              side: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              showCheckmark: false,
              onSelected: (_) {
                setState(() {
                  _selectedCategoryId = 'all';
                });
              },
            );
          }

          final category = categories[index - 1];
          final isSelected = _selectedCategoryId == category.id;

          return ChoiceChip(
            avatar: Icon(
              category.icon,
              size: 16,
              color: isSelected ? Colors.white : AppColors.textSecondary,
            ),
            label: Text(
              category.name,
              style: AppTypography.labelSmall.copyWith(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            selected: isSelected,
            selectedColor: AppColors.primary,
            backgroundColor: Colors.white,
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.border,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            showCheckmark: false,
            onSelected: (_) {
              setState(() {
                _selectedCategoryId = category.id;
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildControlsBar(int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: 6,
      ),
      child: Row(
        children: [
          Text(
            '$count ${count == 1 ? "service" : "services"} found',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          // Price Filter Button
          OutlinedButton.icon(
            onPressed: _showPriceFilterSheet,
            icon: Icon(
              Icons.tune_rounded,
              size: 14,
              color: _maxPriceFilter != null
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
            label: Text(
              _maxPriceFilter != null
                  ? '< \$${_maxPriceFilter!.toInt()}'
                  : 'Price',
              style: AppTypography.labelSmall.copyWith(
                color: _maxPriceFilter != null
                    ? AppColors.primary
                    : AppColors.textSecondary,
                fontWeight: _maxPriceFilter != null
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: const Size(0, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              side: BorderSide(
                color: _maxPriceFilter != null
                    ? AppColors.primary
                    : AppColors.border,
              ),
              backgroundColor: _maxPriceFilter != null
                  ? AppColors.primaryContainer
                  : Colors.white,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          // Sort Dropdown Button
          OutlinedButton.icon(
            onPressed: _showSortOptionSheet,
            icon: Icon(
              Icons.sort_rounded,
              size: 14,
              color: _selectedSort != ServiceSortOption.recommended
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
            label: Text(
              _selectedSort == ServiceSortOption.recommended
                  ? 'Sort'
                  : _selectedSort.label,
              style: AppTypography.labelSmall.copyWith(
                color: _selectedSort != ServiceSortOption.recommended
                    ? AppColors.primary
                    : AppColors.textSecondary,
                fontWeight: _selectedSort != ServiceSortOption.recommended
                    ? FontWeight.w700
                    : FontWeight.w500,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              minimumSize: const Size(0, 32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              side: BorderSide(
                color: _selectedSort != ServiceSortOption.recommended
                    ? AppColors.primary
                    : AppColors.border,
              ),
              backgroundColor: _selectedSort != ServiceSortOption.recommended
                  ? AppColors.primaryContainer
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: 4,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            if (_searchController.text.trim().isNotEmpty) ...[
              _ActiveFilterChip(
                label: 'Query: "${_searchController.text.trim()}"',
                onRemove: () {
                  _searchController.clear();
                  setState(() {});
                },
              ),
              const SizedBox(width: 6),
            ],
            if (_selectedCategoryId != 'all') ...[
              _ActiveFilterChip(
                label: MockHomeData.categories
                    .firstWhere(
                      (c) => c.id == _selectedCategoryId,
                      orElse: () => const ServiceCategory(
                        id: '',
                        name: 'Category',
                        icon: Icons.category,
                        serviceCount: 0,
                      ),
                    )
                    .name,
                onRemove: () {
                  setState(() {
                    _selectedCategoryId = 'all';
                  });
                },
              ),
              const SizedBox(width: 6),
            ],
            if (_maxPriceFilter != null) ...[
              _ActiveFilterChip(
                label: 'Max \$${_maxPriceFilter!.toInt()}',
                onRemove: () {
                  setState(() {
                    _maxPriceFilter = null;
                  });
                },
              ),
              const SizedBox(width: 6),
            ],
            if (_selectedSort != ServiceSortOption.recommended) ...[
              _ActiveFilterChip(
                label: _selectedSort.label,
                onRemove: () {
                  setState(() {
                    _selectedSort = ServiceSortOption.recommended;
                  });
                },
              ),
              const SizedBox(width: 6),
            ],
            InkWell(
              onTap: _clearAllFilters,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Clear all',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesList(List<ServiceItem> services) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: services.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.md),
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceCard(
          service: service,
          onCardTap: () => context.push('/services/${service.id}'),
          onBookTap: () => context.push('/services/${service.id}'),
        );
      },
    );
  }

  Widget _buildEmptyResultsState() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.surfaceSubtle,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search_off_rounded,
                size: 36,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            const Text(
              'No services match your criteria',
              style: AppTypography.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Try adjusting your search terms or clearing price and category filters to browse all services.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.45,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton.icon(
              onPressed: _clearAllFilters,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Reset All Filters'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortOptionSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Sort Services By',
                    style: AppTypography.headlineSmall,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                for (final option in ServiceSortOption.values)
                  ListTile(
                    title: Text(
                      option.label,
                      style: AppTypography.bodyMedium.copyWith(
                        color: _selectedSort == option
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        fontWeight: _selectedSort == option
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                    trailing: _selectedSort == option
                        ? const Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.primary,
                            size: 22,
                          )
                        : const Icon(
                            Icons.radio_button_unchecked_rounded,
                            color: AppColors.border,
                            size: 22,
                          ),
                    onTap: () {
                      setState(() {
                        _selectedSort = option;
                      });
                      Navigator.of(sheetContext).pop();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPriceFilterSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        final priceOptions = <double?>[null, 50, 75, 100, 150];

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Filter by Maximum Price',
                  style: AppTypography.headlineSmall,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Show services under your preferred budget threshold',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (final price in priceOptions)
                      ChoiceChip(
                        label: Text(
                          price == null ? 'Any Price' : 'Under \$$price',
                          style: TextStyle(
                            color: _maxPriceFilter == price
                                ? Colors.white
                                : AppColors.textPrimary,
                            fontWeight: _maxPriceFilter == price
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                        selected: _maxPriceFilter == price,
                        selectedColor: AppColors.primary,
                        backgroundColor: AppColors.surfaceSubtle,
                        side: BorderSide(
                          color: _maxPriceFilter == price
                              ? AppColors.primary
                              : AppColors.border,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusFull,
                          ),
                        ),
                        showCheckmark: false,
                        onSelected: (_) {
                          setState(() {
                            _maxPriceFilter = price;
                          });
                          Navigator.of(sheetContext).pop();
                        },
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _maxPriceFilter = null;
                      });
                      Navigator.of(sheetContext).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Reset Price Filter'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ActiveFilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _ActiveFilterChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 6, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
        border: Border.all(color: const Color(0x441D4ED8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 4),
          InkWell(
            onTap: onRemove,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            child: const Icon(
              Icons.close_rounded,
              size: 15,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
