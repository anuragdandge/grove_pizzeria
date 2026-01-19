import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      activeSection: 'about',
      child: Column(
        children: [
          _buildOurStorySection(context),
          _buildAboutDetailSection(context),
          _buildPillarsSection(context),
        ],
      ),
    );
  }

  Widget _buildOurStorySection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OUR STORY',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.groveEspresso.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'From Fire to Table',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 32),
                Text(
                  'At Grove, every pizza tells a story. Our wood-fired oven, the heart of our kitchen, reaches temperatures that create the perfect char and those signature leopard spots on our hand-stretched dough.\n\nWe source locally, craft passionately, and serve generously—because pizza is more than food, it\'s a gathering, a celebration, a moment of pure joy.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 48),
                OutlineButton(text: 'READ OUR STORY', onTap: () {}),
              ],
            ),
          ),
          const SizedBox(width: 80),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=1974&auto=format&fit=crop',
                height: 600,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutDetailSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Column(
        children: [
          Text(
            'A Love Letter to Wood-Fired Craft',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            itemCount: 5,
            itemBuilder: (context, index) {
              final heights = [400, 600, 450, 500, 400];
              final images = [
                'https://images.unsplash.com/photo-1541745537411-b8046dc6d66c?q=80&w=1976&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?q=80&w=2070&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1550966841-3ee7adac1668?q=80&w=2070&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1559339352-11d035aa65de?q=80&w=1974&auto=format&fit=crop',
                'https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?q=80&w=2070&auto=format&fit=crop',
              ];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  images[index % images.length],
                  height: heights[index % heights.length].toDouble(),
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPillarsSection(BuildContext context) {
    return Container(
      color: AppColors.groveEspresso,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildPillarItem(
            'Craft',
            'Traditional techniques met with modern intuition.',
          ),
          _buildPillarItem(
            'Community',
            'A place where everyone has a seat at the table.',
          ),
          _buildPillarItem(
            'Quality',
            'Only the finest San Marzano tomatoes and fior di latte.',
          ),
        ],
      ),
    );
  }

  Widget _buildPillarItem(String title, String desc) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 48,
            fontStyle: FontStyle.italic,
            color: AppColors.groveHoney,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: 250,
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.groveCream.withValues(alpha: 0.8),
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
