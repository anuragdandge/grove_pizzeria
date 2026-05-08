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
    {'image': 'assets/pizza_in_making.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/pasta 1.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/chef_with_the_boxes.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/smoky_oven.JPG', 'category': 'THE AMBIANCE'},
    {'image': 'assets/pizza_boxes.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/from_fire_to_table.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/base_in_the_air.jpg', 'category': 'THE PEOPLE'},
    {'image': 'assets/oven_pizza_2.jpg', 'category': 'THE AMBIANCE'},
    {'image': 'assets/picnic.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/getting_pizza_out.JPG', 'category': 'THE AMBIANCE'},
    {'image': 'assets/IMG_2913.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/pasta 2.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/team_1.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/team_2.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/team_3.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/chef_1.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/chef_2.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/dough_in_the_air.JPG', 'category': 'THE AMBIANCE'},
    {'image': 'assets/eating_pizza.JPG', 'category': 'THE AMBIANCE'},
    {'image': 'assets/eating_pizza_1.JPG', 'category': 'THE AMBIANCE'},
    {'image': 'assets/popeys_protein_1.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/Classic_Paparoni.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/creamy_pesto_farfalle.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/Mushroom Bechamel with Spaghetti.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/Sweet Potato Gnocchi with Sundried Tomato Sauce.jpg', 'category': 'THE FOOD'},
    {'image': 'assets/dough_by_the_bros.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/team_4.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/team_5.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/team_6.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/chef_3.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/chef_4.JPG', 'category': 'THE PEOPLE'},
    {'image': 'assets/creamy_pesto_farfalle_2.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/Mushroom Bechamel with Spaghetti_1.JPG', 'category': 'THE FOOD'},
    {'image': 'assets/popeys_protein_2.JPG', 'category': 'THE FOOD'},
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
      child: MasonryGridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: isSmallScreen ? 1 : 3,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              filteredItems[index]['image']!,
              fit: BoxFit.cover,
              // Optimization: Decode images at a smaller size to save memory
              cacheWidth: isSmallScreen ? 800 : 600,
              // Use a placeholder to make loading feel smoother
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) return child;
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: AppColors.groveCream,
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
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
