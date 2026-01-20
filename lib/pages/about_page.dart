import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 900;

        return PageScaffold(
          activeSection: 'about',
          child: Column(
            children: [
              _buildOurStorySection(context, isSmallScreen),
              _buildAboutDetailSection(context, isSmallScreen),
              _buildPillarsSection(context, isSmallScreen),
              _buildVisitUsSection(context, isSmallScreen),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOurStorySection(BuildContext context, bool isSmallScreen) {
    if (isSmallScreen) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OUR STORY',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.groveEspresso.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'A Love Letter to Wood-Fired Craft',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 32),
            Text(
              'Grove Pizzeria was born from a simple belief: that the best moments in life are shared around a table, breaking bread—or in our case, perfectly charred pizza.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/pizzeria-interior.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OUR STORY',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.groveEspresso.withOpacity(0.6),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              child: Text(
                'A Love Letter to Wood-Fired Craft',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: AppColors.groveEspresso,
                  height: 1.1,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 600,
              child: Text(
                'Grove Pizzeria was born from a simple belief: that the best moments in life are shared around a table, breaking bread—or in our case, perfectly charred pizza.',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.7),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildAboutDetailSection(BuildContext context, bool isSmallScreen) {
    if (isSmallScreen) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Wood-Fired Way',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),
            Text(
              'Our journey begins with a fascination for fire. Not just any fire, but the ancient dance of flames in a wood-fired oven—the kind that transforms simple dough into something magical.\n\nWe aren\'t mere perfecting our craft, traveling to Naples, learning from masters who\'ve been baking for generations. We brought that knowledge home and added our own twist: a celebration of local ingredients and neighborhood warmth.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 40),
            Text(
              'Our Ingredients',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),
            Text(
              'We\'re obsessive about sourcing. Our flour? Stone-ground from heritage wheat. Our tomatoes? San Marzano, kissed by Italian sun. Our mozzarella? Fresh daily, made by local artisans who share our passion.\n\nBut we also believe in celebrating what\'s close to home. Local farms supply our vegetables, nearby dairies provide our cheeses, and the basil? That grows right in our window boxes.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/margherita-pizza.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: AppColors.groveCream,
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/pizzeria-interior.jpg',
                width: double.infinity,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Wood-Fired Way',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: AppColors.groveEspresso,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Our journey begins with a fascination for fire. Not just any fire, but the ancient dance of flames in a wood-fired oven—the kind that transforms simple dough into something magical.\n\nWe aren\'t mere perfecting our craft, traveling to Naples, learning from masters who\'ve been baking for generations. We brought that knowledge home and added our own twist: a celebration of local ingredients and neighborhood warmth.\n\n"Grove" is our name isn\'t just poetic—it represents our commitment to sustainability, to gathering spaces, to the idea that a pizzeria should feel like an extension of your own table.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Ingredients',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: AppColors.groveEspresso,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'We\'re obsessive about sourcing. Our flour? Stone-ground from heritage wheat. Our tomatoes? San Marzano, kissed by Italian sun. Our mozzarella? Fresh daily, made by local artisans who share our passion.\n\nBut we also believe in celebrating what\'s close to home. Local farms supply our vegetables, nearby dairies provide our cheeses, and the basil? That grows right in our window boxes.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          height: 1.8,
                        ),
                      ),
                      const SizedBox(height: 32),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/margherita-pizza.jpg',
                          width: double.infinity,
                          height: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      );
    }
  }

  Widget _buildPillarsSection(BuildContext context, bool isSmallScreen) {
    if (isSmallScreen) {
      return Container(
        color: AppColors.groveEspresso,
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
        child: Column(
          children: [
            Text(
              'Our Pillars',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: AppColors.groveCream),
            ),
            const SizedBox(height: 60),
            _buildPillarItem(
              context,
              'Craft',
              'Every pizza is shaped by hand, fired at exactly 900°F, and made with a reverence for tradition that goes beyond mere technique—it\'s a love language, spoken through dough.',
              isSmallScreen,
            ),
            const SizedBox(height: 50),
            _buildPillarItem(
              context,
              'Community',
              'We\'re not just a pizzeria—we\'re your neighborhood gathering spot, a place where strangers become friends over a shared Margherita and a glass of wine.',
              isSmallScreen,
            ),
            const SizedBox(height: 50),
            _buildPillarItem(
              context,
              'Quality',
              'No shortcuts. No compromises. From sourcing the finest ingredients to the distribution of toppings on each pie, we obsess over the details so you can simply enjoy.',
              isSmallScreen,
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: AppColors.groveEspresso,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 120),
        child: Column(
          children: [
            Text(
              'Our Pillars',
              style: GoogleFonts.playfairDisplay(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: AppColors.groveCream,
              ),
            ),
            const SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildPillarItem(
                    context,
                    'Craft',
                    'Every pizza is shaped by hand, fired at exactly 900°F, and made with a reverence for tradition that goes beyond mere technique—it\'s a love language, spoken through dough.',
                    isSmallScreen,
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(
                  child: _buildPillarItem(
                    context,
                    'Community',
                    'We\'re not just a pizzeria—we\'re your neighborhood gathering spot, a place where strangers become friends over a shared Margherita and a glass of wine.',
                    isSmallScreen,
                  ),
                ),
                const SizedBox(width: 60),
                Expanded(
                  child: _buildPillarItem(
                    context,
                    'Quality',
                    'No shortcuts. No compromises. From sourcing the finest ingredients to the distribution of toppings on each pie, we obsess over the details so you can simply enjoy.',
                    isSmallScreen,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  Widget _buildPillarItem(
    BuildContext context,
    String title,
    String desc,
    bool isSmallScreen,
  ) {
    return Column(
      crossAxisAlignment: isSmallScreen
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: isSmallScreen ? 36 : 48,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: AppColors.groveHoney,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          desc,
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
          style: GoogleFonts.ibarraRealNova(
            color: AppColors.groveCream.withOpacity(0.9),
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildVisitUsSection(BuildContext context, bool isSmallScreen) {
    return Container(
      color: AppColors.groveCream,
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isSmallScreen ? 30 : 120,
      ),
      child: Column(
        children: [
          Text(
            'Experience the Grove',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 40 : 56,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveEspresso,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'We’re located in the heart of Baner. Come by for a slice, some fresh pasta, and an evening to remember.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.groveEspresso.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 48),
          if (isSmallScreen)
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    text: 'GET DIRECTIONS',
                    onTap: () =>
                        _launchURL('https://maps.app.goo.gl/MeLECRNAMo2CdZH69'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlineButton(
                    text: 'BOOK A TABLE',
                    onTap: () => _launchURL(
                      'https://www.google.com/maps/reserve/v/dine/c/uV5GJSx1lCk?source=pa&opi=89978449&hl=en-IN&gei=QMtvaa23NML31e8Pyb_PCQ&sourceurl=https://www.google.com/search?client%3Dfirefox-b-d%26q%3Dgrove%2Bpizzeria%26sei%3DNctvadCCIPLW1e8PtOuc8AQ%26dlnr%3D1',
                    ),
                  ),
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: 'GET DIRECTIONS',
                  onTap: () =>
                      _launchURL('https://maps.app.goo.gl/MeLECRNAMo2CdZH69'),
                ),
                const SizedBox(width: 24),
                OutlineButton(
                  text: 'BOOK A TABLE',
                  onTap: () => _launchURL(
                    'https://www.google.com/maps/reserve/v/dine/c/uV5GJSx1lCk?source=pa&opi=89978449&hl=en-IN&gei=QMtvaa23NML31e8Pyb_PCQ&sourceurl=https://www.google.com/search?client%3Dfirefox-b-d%26q%3Dgrove%2Bpizzeria%26sei%3DNctvadCCIPLW1e8PtOuc8AQ%26dlnr%3D1',
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
