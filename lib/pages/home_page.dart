import 'package:flutter/material.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          activeSection: 'home',
          child: Column(
            children: [
              _buildHeroSection(context, isSmallScreen),
              _buildStorySection(context, isSmallScreen),
              _buildDiscoverSection(context, isSmallScreen),
              _buildQuoteSection(context, isSmallScreen),
              _buildReadyToTasteSection(context, isSmallScreen),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isSmallScreen) {
    return Container(
      height: isSmallScreen ? MediaQuery.of(context).size.height - 80 : 800,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hero-pizza.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Authentic Slices,\nRooted in the Grove',
                  textAlign: TextAlign.center,
                  style:
                      (isSmallScreen
                              ? Theme.of(context).textTheme.displayMedium
                              : Theme.of(context).textTheme.displayLarge)
                          ?.copyWith(color: AppColors.groveCream, height: 1.1),
                ),
                const SizedBox(height: 24),
                Text(
                  'Authentic sourdough Neapolitan pizzas, handmade pastas, and cozy ambiance in the heart of Baner. Famous for our pillowy soft crusts.',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.groveCream.withOpacity(0.9),
                    fontSize: isSmallScreen ? 16 : 20,
                  ),
                ),
                const SizedBox(height: 48),
                if (isSmallScreen)
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                          text: 'EXPLORE MENU',
                          onTap: () => Navigator.pushNamed(context, '/menu'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: SecondaryButton(
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
                        text: 'EXPLORE MENU',
                        onTap: () => Navigator.pushNamed(context, '/menu'),
                      ),
                      const SizedBox(width: 24),
                      SecondaryButton(
                        text: 'BOOK A TABLE',
                        onTap: () => _launchURL(
                          'https://www.google.com/maps/reserve/v/dine/c/uV5GJSx1lCk?source=pa&opi=89978449&hl=en-IN&gei=QMtvaa23NML31e8Pyb_PCQ&sourceurl=https://www.google.com/search?client%3Dfirefox-b-d%26q%3Dgrove%2Bpizzeria%26sei%3DNctvadCCIPLW1e8PtOuc8AQ%26dlnr%3D1',
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStorySection(BuildContext context, bool isSmallScreen) {
    if (isSmallScreen) {
      return Container(
        color: AppColors.groveCream,
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
              'From Fire to Table',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 32),
            Text(
              'A popular spot in Baner known for its authentic sourdough Neapolitan pizzas, handmade pastas, and cozy ambiance. Famous for its pillowy soft crusts and exquisite Tiramisu.\n\nWe source locally, craft passionately, and serve generously—because pizza is more than food, it\'s a gathering, a celebration, a moment of pure joy.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 40),
            OutlineButton(
              text: 'READ OUR STORY',
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            const SizedBox(height: 60),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                'assets/pizza-making.jpg',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: AppColors.groveCream,
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
                      color: AppColors.groveEspresso.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'From Fire to Table',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'A popular spot in Baner known for its authentic sourdough Neapolitan pizzas, handmade pastas, and cozy ambiance. Famous for its pillowy soft crusts and exquisite Tiramisu.\n\nWe source locally, craft passionately, and serve generously—because pizza is more than food, it\'s a gathering, a celebration, a moment of pure joy.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 40),
                  OutlineButton(
                    text: 'READ OUR STORY',
                    onTap: () => Navigator.pushNamed(context, '/about'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 80),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  'assets/pizza-making.jpg',
                  width: double.infinity,
                  height: 600,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildDiscoverSection(BuildContext context, bool isSmallScreen) {
    return Container(
      color: AppColors.groveCreamLight,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 60 : 120,
        horizontal: isSmallScreen ? 30 : 100,
      ),
      child: Column(
        children: [
          Text(
            'DISCOVER',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'What\'s Cooking at the Grove',
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: isSmallScreen ? 40 : 80),
          if (isSmallScreen)
            Column(
              children: [
                _buildDiscoverCard(
                  context,
                  'The Menu',
                  'From classic Margherita to seasonal specials—explore our wood-fired creations.',
                  'assets/margherita-pizza.jpg',
                  () => Navigator.pushNamed(context, '/menu'),
                  true,
                ),
                const SizedBox(height: 40),
                _buildDiscoverCard(
                  context,
                  'Feature Gallery',
                  'A visual feast of our pizzas, space, and the moments we cherish.',
                  'assets/pizzeria-interior.jpg',
                  () => Navigator.pushNamed(context, '/gallery'),
                  true,
                ),
                const SizedBox(height: 40),
                _buildDiscoverCard(
                  context,
                  'Order Now',
                  'Can\'t make it to the Grove? We\'ll bring the fire to your doorstep.',
                  'assets/pizza-slice.jpg',
                  () => Navigator.pushNamed(context, '/order'),
                  true,
                ),
              ],
            )
          else
            Row(
              children: [
                _buildDiscoverCard(
                  context,
                  'The Menu',
                  'From classic Margherita to seasonal specials—explore our wood-fired creations.',
                  'assets/margherita-pizza.jpg',
                  () => Navigator.pushNamed(context, '/menu'),
                  false,
                ),
                const SizedBox(width: 40),
                _buildDiscoverCard(
                  context,
                  'Feature Gallery',
                  'A visual feast of our pizzas, space, and the moments we cherish.',
                  'assets/pizzeria-interior.jpg',
                  () => Navigator.pushNamed(context, '/gallery'),
                  false,
                ),
                const SizedBox(width: 40),
                _buildDiscoverCard(
                  context,
                  'Order Now',
                  'Can\'t make it to the Grove? We\'ll bring the fire to your doorstep.',
                  'assets/pizza-slice.jpg',
                  () => Navigator.pushNamed(context, '/order'),
                  false,
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
    bool isSmallScreen,
  ) {
    bool isHovered = false;
    Widget content = StatefulBuilder(
      builder: (context, setCardState) {
        return MouseRegion(
          onEnter: (_) => setCardState(() => isHovered = true),
          onExit: (_) => setCardState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Transform.scale(
                          scale: isHovered ? 1.05 : 1.0,
                          child: Image.asset(imageUrl, fit: BoxFit.cover),
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
    );

    return isSmallScreen ? content : Expanded(child: content);
  }

  Widget _buildQuoteSection(BuildContext context, bool isSmallScreen) {
    return Container(
      width: double.infinity,
      color: AppColors.groveEspresso,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 80 : 120,
        horizontal: isSmallScreen ? 30 : 100,
      ),
      child: Column(
        children: [
          Text(
            '"The best pizza is the one shared with people you love, in a place that feels like home."',
            textAlign: TextAlign.center,
            style:
                (isSmallScreen
                        ? Theme.of(context).textTheme.headlineMedium
                        : Theme.of(context).textTheme.headlineLarge)
                    ?.copyWith(
                      color: AppColors.groveCream,
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
          ),
          const SizedBox(height: 40),
          Text(
            '— THE GROVE FAMILY',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveCream.withOpacity(0.7),
              letterSpacing: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadyToTasteSection(BuildContext context, bool isSmallScreen) {
    return Container(
      color: AppColors.groveCream,
      padding: EdgeInsets.symmetric(
        vertical: isSmallScreen ? 80 : 120,
        horizontal: isSmallScreen ? 30 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Ready to Taste the Fire?',
            textAlign: TextAlign.center,
            style: (isSmallScreen
                ? Theme.of(context).textTheme.headlineMedium
                : Theme.of(context).textTheme.headlineLarge),
          ),
          const SizedBox(height: 24),
          Text(
            'Visit us at the Grove or order online for delivery straight to your door.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.groveEspresso.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 40),
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
