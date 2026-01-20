import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String activeFilter = 'ALL';

  final List<Map<String, String>> _galleryItems = [
    {'image': 'assets/margherita-pizza.jpg', 'category': 'THE FOOD'},
    {'image': 'assets/pizza-slice.jpg', 'category': 'THE FOOD'},
    {'image': 'assets/pizza-making.jpg', 'category': 'THE PEOPLE'},
    {'image': 'assets/pizzeria-interior.jpg', 'category': 'THE AMBIANCE'},
    {'image': 'assets/margherita-pizza.jpg', 'category': 'THE FOOD'},
    {'image': 'assets/truffle-pizza.jpg', 'category': 'THE FOOD'},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 900;
        double horizontalPadding = isSmallScreen ? 24 : 120;

        return PageScaffold(
          activeSection: 'gallery',
          child: Column(
            children: [
              _buildHeaderSection(context, isSmallScreen, horizontalPadding),
              _buildGalleryGrid(context, isSmallScreen, horizontalPadding),
              _buildFollowSection(context, isSmallScreen, horizontalPadding),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        isSmallScreen ? 60 : 80,
        horizontalPadding,
        40,
      ),
      child: Column(
        crossAxisAlignment: isSmallScreen
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.start,
        children: [
          Text(
            'GALLERY',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Moments from the Grove',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 48 : 72,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveEspresso,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isSmallScreen ? double.infinity : 600,
            child: Text(
              'A visual celebration of our food, our space, and the people who make Grove Pizzeria special.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isSmallScreen ? 16 : 18,
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 48),
          if (isSmallScreen)
            Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildFilterTab(context, 'ALL')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildFilterTab(context, 'THE FOOD')),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildFilterTab(context, 'THE AMBIANCE')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildFilterTab(context, 'THE PEOPLE')),
                  ],
                ),
              ],
            )
          else
            Row(
              children: [
                _buildFilterTab(context, 'ALL'),
                const SizedBox(width: 12),
                _buildFilterTab(context, 'THE FOOD'),
                const SizedBox(width: 12),
                _buildFilterTab(context, 'THE AMBIANCE'),
                const SizedBox(width: 12),
                _buildFilterTab(context, 'THE PEOPLE'),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(BuildContext context, String label) {
    bool isSelected = activeFilter == label;
    bool isHovered = false;

    return StatefulBuilder(
      builder: (context, setTabState) {
        return MouseRegion(
          onEnter: (_) => setTabState(() => isHovered = true),
          onExit: (_) => setTabState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () => setState(() => activeFilter = label),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: (isSelected || isHovered)
                    ? AppColors.groveEspresso
                    : Colors.transparent,
                border: Border.all(color: AppColors.groveEspresso, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: (isSelected || isHovered)
                      ? AppColors.groveCream
                      : AppColors.groveEspresso,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGalleryGrid(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    final filteredItems = activeFilter == 'ALL'
        ? _galleryItems
        : _galleryItems.where((i) => i['category'] == activeFilter).toList();

    return Container(
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        20,
        horizontalPadding,
        100,
      ),
      child: isSmallScreen
          ? Column(
              children: filteredItems
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          item['image']!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          : MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                // To mimic the design, we can vary the aspect ratios or just use fit
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    filteredItems[index]['image']!,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }

  Widget _buildFollowSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      color: AppColors.groveEspresso,
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: horizontalPadding,
      ),
      child: Column(
        children: [
          Text(
            'Follow the Journey',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 36 : 48,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveCream,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'For daily slices, behind-the-scenes, and pizza moments—find us on Instagram.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.groveCream.withValues(alpha: 0.7),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            text: '@GROVE_PIZZERIA',
            onTap: () async {
              final url = Uri.parse('https://instagram.com/grove_pizzeria');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
        ],
      ),
    );
  }
}
