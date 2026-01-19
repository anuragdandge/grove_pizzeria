import 'package:flutter/material.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      activeSection: 'home',
      child: Column(
        children: [
          _buildHeroSection(context),
          _buildDiscoverSection(context),
          _buildJournalSection(context),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=2070&auto=format&fit=crop',
                ),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.black.withValues(alpha: 0.5),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Authentic Slices,\nRooted in the Grove',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.groveCream,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Wood-fired perfection, crafted with passion and served with love\nin our neighborhood pizzeria.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.groveCream.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    text: 'EXPLORE MENU',
                    onTap: () => Navigator.pushNamed(context, '/menu'),
                  ),
                  const SizedBox(width: 24),
                  SecondaryButton(
                    text: 'ORDER NOW',
                    onTap: () => Navigator.pushNamed(context, '/order'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverSection(BuildContext context) {
    return Container(
      color: AppColors.groveCreamLight,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Column(
        children: [
          Text(
            'DISCOVER',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'What\'s Cooking at the Grove',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 80),
          Row(
            children: [
              _buildDiscoverCard(
                context,
                'The Menu',
                'From classic Margherita to seasonal specials—explore our wood-fired creations.',
                'https://images.unsplash.com/photo-1574129623232-bbad5051660d?q=80&w=1974&auto=format&fit=crop',
                () => Navigator.pushNamed(context, '/menu'),
              ),
              const SizedBox(width: 40),
              _buildDiscoverCard(
                context,
                'Feature Gallery',
                'A visual feast of our pizzas, space, and the moments we cherish.',
                'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop',
                () => Navigator.pushNamed(context, '/gallery'),
              ),
              const SizedBox(width: 40),
              _buildDiscoverCard(
                context,
                'Order Now',
                'Can\'t make it to the Grove? We\'ll bring the fire to your doorstep.',
                'https://images.unsplash.com/photo-1526367790999-015070f23f.jpg?q=80&w=2070&auto=format&fit=crop',
                () => Navigator.pushNamed(context, '/order'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDiscoverCard(
    BuildContext context,
    String title,
    String desc,
    String imageUrl,
    VoidCallback onTap,
  ) {
    bool isHovered = false;
    return Expanded(
      child: StatefulBuilder(
        builder: (context, setCardState) {
          return MouseRegion(
            onEnter: (_) => setCardState(() => isHovered = true),
            onExit: (_) => setCardState(() => isHovered = false),
            cursor: SystemMouseCursors.click,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Transform.scale(
                            scale: isHovered ? 1.05 : 1.0,
                            child: Image.network(imageUrl, fit: BoxFit.cover),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(onTap: onTap, child: Container()),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Text(desc, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: onTap,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'EXPLORE',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 12,
                          color: isHovered
                              ? AppColors.groveHoneyDark
                              : AppColors.groveEspresso,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Transform.translate(
                        offset: Offset(isHovered ? 4 : 0, 0),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: isHovered
                              ? AppColors.groveHoneyDark
                              : AppColors.groveEspresso,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildJournalSection(BuildContext context) {
    return Container(
      color: AppColors.groveCreamLight,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Column(
        children: [
          Text(
            'STORIES & JOURNAL',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 80),
          Row(
            children: [
              _buildJournalCard(
                context,
                'Sourcing San Marzano',
                'The journey to find the perfect volcanic soil tomatoes.',
                'Jan 15, 2026',
              ),
              const SizedBox(width: 40),
              _buildJournalCard(
                context,
                'The Art of Slow Dough',
                'Why we ferment our dough for exactly 48 hours.',
                'Jan 10, 2026',
              ),
              const SizedBox(width: 40),
              _buildJournalCard(
                context,
                'The Perfect Pairing',
                'Local craft beers that complement our spice.',
                'Jan 05, 2026',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildJournalCard(
    BuildContext context,
    String title,
    String summary,
    String date,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: AppColors.groveEspresso.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(child: Icon(Icons.image_outlined, size: 40)),
          ),
          const SizedBox(height: 24),
          Text(
            date,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 12,
              color: AppColors.groveHoneyDark,
            ),
          ),
          const SizedBox(height: 12),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(summary, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
