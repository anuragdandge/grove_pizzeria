import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      activeSection: 'gallery',
      child: Column(children: [_buildGallerySection(context)]),
    );
  }

  Widget _buildGallerySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Column(
        children: [
          Text(
            'Moments from the Grove',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterTab(context, 'ALL', true),
              _buildFilterTab(context, 'THE FOOD', false),
              _buildFilterTab(context, 'THE AMBIANCE', false),
              _buildFilterTab(context, 'THE PEOPLE', false),
            ],
          ),
          const SizedBox(height: 64),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemCount: 9,
            itemBuilder: (context, index) {
              return Container(
                height: (index % 3 + 2) * 100.0,
                decoration: BoxDecoration(
                  color: AppColors.groveEspresso.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.photo_outlined,
                    color: AppColors.groveEspresso.withValues(alpha: 0.2),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 80),
          Column(
            children: [
              Text(
                'Follow the Journey',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
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
        ],
      ),
    );
  }

  Widget _buildFilterTab(BuildContext context, String label, bool isSelected) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setTabState) {
        return MouseRegion(
          onEnter: (_) => setTabState(() => isHovered = true),
          onExit: (_) => setTabState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
              onTap: () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: (isSelected || isHovered)
                      ? AppColors.groveEspresso
                      : Colors.transparent,
                  border: Border.all(color: AppColors.groveEspresso),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: (isSelected || isHovered)
                        ? AppColors.groveCream
                        : AppColors.groveEspresso,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
