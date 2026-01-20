import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 900;
        double horizontalPadding = isSmallScreen ? 24 : 120;
        return PageScaffold(
          activeSection: 'menu',
          child: Column(
            children: [
              _buildHeroSection(context, isSmallScreen, horizontalPadding),
              _buildMenuSection(context, isSmallScreen, horizontalPadding),
              _buildChefsSpecialSection(
                context,
                isSmallScreen,
                horizontalPadding,
              ),
              _buildJournalSection(context, isSmallScreen, horizontalPadding),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroSection(
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
        isSmallScreen ? 40 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OUR MENU',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isSmallScreen ? double.infinity : 700,
            child: Text(
              'From Our Oven to\nYour Table',
              style: GoogleFonts.playfairDisplay(
                fontSize: isSmallScreen ? 48 : 72,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: AppColors.groveEspresso,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: isSmallScreen ? double.infinity : 600,
            child: Text(
              'Every pizza is hand-stretched, wood-fired, and made with love. Our menu celebrates local souls and traditions.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isSmallScreen ? 16 : 18,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      // On large screen, we keep the content centralized but stacked
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        40,
        horizontalPadding,
        80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Serve',
            style: GoogleFonts.playfairDisplay(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.groveEspresso,
            ),
          ),
          const SizedBox(height: 48),
          // All categories stacked vertically as per the latest design reference
          _buildMenuCategory(context, 'Red Base', _redBaseItems, isSmallScreen),
          const SizedBox(height: 60),
          _buildMenuCategory(
            context,
            'White Base',
            _whiteBaseItems,
            isSmallScreen,
          ),
          const SizedBox(height: 60),
          _buildMenuCategory(
            context,
            'Small Plates',
            _smallPlatesItems,
            isSmallScreen,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCategory(
    BuildContext context,
    String title,
    List<Map<String, String>> items,
    bool isSmallScreen,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: AppColors.groveEspresso,
          ),
        ),
        const SizedBox(height: 32),
        // Limit width on desktop for better readability in single column
        SizedBox(
          width: isSmallScreen ? double.infinity : 1000,
          child: Column(
            children: items
                .map(
                  (item) => _buildMenuItem(
                    context,
                    item['name']!,
                    item['desc']!,
                    item['price']!,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String name,
    String desc,
    String price,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.josefinSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.groveEspresso,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.groveEspresso.withValues(alpha: 0.7),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Text(
            price,
            style: GoogleFonts.josefinSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.groveEspresso,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChefsSpecialSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      color: AppColors.groveCream, // Subtle distinction
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: horizontalPadding,
      ),
      child: Column(
        children: [
          Text(
            'CURATED SELECTION',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Chef\'s Special',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 40 : 56,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveEspresso,
            ),
          ),
          const SizedBox(height: 80),
          _buildSpecialItem(
            context,
            'Winter Truffle\nForest',
            'A rich medley of flavors: earthy black truffles, wood-fired mushrooms, fontina, parmigiano, and a touch of fresh rosemary. Fired to perfection with a hint of smoke.',
            '₹850',
            'assets/truffle-pizza.jpg',
            isSmallScreen,
            isReversed: false,
          ),
          SizedBox(height: isSmallScreen ? 80 : 120),
          _buildSpecialItem(
            context,
            'Nduja Fire',
            'Our boldest creation yet. Spicy Calabrian Nduja, spread across San Marzano tomatoes, burrata, honey-drizzled red onions, and hot chilies. A spicy, creamy, and salty masterpiece.',
            '₹750',
            'assets/margherita-pizza.jpg',
            isSmallScreen,
            isReversed: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialItem(
    BuildContext context,
    String title,
    String desc,
    String price,
    String imageUrl,
    bool isSmallScreen, {
    required bool isReversed,
  }) {
    Widget imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        imageUrl,
        width: isSmallScreen ? double.infinity : 600,
        height: isSmallScreen ? 350 : 500,
        fit: BoxFit.cover,
      ),
    );

    Widget textWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.playfairDisplay(
            fontSize: isSmallScreen ? 32 : 48,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: AppColors.groveEspresso,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          desc,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontSize: 18, height: 1.7),
        ),
        const SizedBox(height: 32),
        Text(
          price,
          style: GoogleFonts.josefinSans(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.groveHoneyDark,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Available through this year',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.groveEspresso.withValues(alpha: 0.5),
            fontSize: 12,
          ),
        ),
      ],
    );

    if (isSmallScreen) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [imageWidget, const SizedBox(height: 40), textWidget],
      );
    }

    return Row(
      children: [
        if (!isReversed) ...[
          Expanded(flex: 5, child: imageWidget),
          const SizedBox(width: 80),
          Expanded(flex: 4, child: textWidget),
        ] else ...[
          Expanded(flex: 4, child: textWidget),
          const SizedBox(width: 80),
          Expanded(flex: 5, child: imageWidget),
        ],
      ],
    );
  }

  Widget _buildJournalSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 120,
        horizontal: horizontalPadding,
      ),
      child: Column(
        children: [
          Text(
            'STAY IN THE LOOP',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'The Grove Journal',
            style: GoogleFonts.playfairDisplay(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.groveEspresso,
            ),
          ),
          const SizedBox(height: 80),
          if (isSmallScreen)
            Column(
              children: [
                _buildJournalCard(
                  context,
                  'OCT 12, 2025',
                  'The Secret to Our Dough',
                  'A behind-the-scenes look at our 48-hour fermentation process.',
                ),
                const SizedBox(height: 32),
                _buildJournalCard(
                  context,
                  'SEP 28, 2025',
                  'Sourcing the Best Burrata',
                  'A journey to local dairies to find the creamiest cheese for your table.',
                ),
                const SizedBox(height: 32),
                _buildJournalCard(
                  context,
                  'AUG 15, 2025',
                  'Wood-Fired vs Electric',
                  'Why the ancient art of fire makes all the difference in every bite.',
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: _buildJournalCard(
                    context,
                    'OCT 12, 2025',
                    'The Secret to Our Dough',
                    'A behind-the-scenes look at our 48-hour fermentation process.',
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: _buildJournalCard(
                    context,
                    'SEP 28, 2025',
                    'Sourcing the Best Burrata',
                    'A journey to local dairies to find the creamiest cheese for your table.',
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: _buildJournalCard(
                    context,
                    'AUG 15, 2025',
                    'Wood-Fired vs Electric',
                    'Why the ancient art of fire makes all the difference in every bite.',
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildJournalCard(
    BuildContext context,
    String date,
    String title,
    String excerpt,
  ) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.groveCreamLight,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 12,
              color: AppColors.groveEspresso.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.groveEspresso,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            excerpt,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }

  final List<Map<String, String>> _redBaseItems = [
    {
      'name': 'Margherita D.O.C.',
      'desc':
          'San Marzano tomatoes, buffalo mozzarella, fresh basil, extra virgin olive oil.',
      'price': '₹550',
    },
    {
      'name': 'Diavola',
      'desc':
          'Spicy Salami, San Marzano tomatoes, fior di latte, and pickled chili peppers.',
      'price': '₹750',
    },
    {
      'name': 'Quattro Formaggi',
      'desc':
          'Gorgonzola, buffalo mozzarella, fontina, parmigiano, and a drizzle of honey.',
      'price': '₹850',
    },
    {
      'name': 'Prosciutto e Rucola',
      'desc':
          'Fresh cherry tomatoes, buffalo mozzarella, prosciutto crudo, and fresh arugula.',
      'price': '₹850',
    },
    {
      'name': 'Marinara',
      'desc':
          'San Marzano tomatoes, garlic, oregano, and extra virgin olive oil.',
      'price': '₹450',
    },
  ];

  final List<Map<String, String>> _whiteBaseItems = [
    {
      'name': 'Tartufo Bianco',
      'desc':
          'Black truffle cream, wood-fired mushrooms, fior di latte, and fresh thyme.',
      'price': '₹950',
    },
    {
      'name': 'Patata e Rosmarino',
      'desc':
          'Thinly sliced potatoes, rosemary, mozzarella, and fior di latte.',
      'price': '₹750',
    },
    {
      'name': 'Salsiccia e Friarielli',
      'desc':
          'Italian sausage, wild broccoli rabe, mozzarella, and parmigiano.',
      'price': '₹850',
    },
    {
      'name': 'Pizza Bianca',
      'desc': 'Garlic, sea salt, fresh rosemary, and extra virgin olive oil.',
      'price': '₹450',
    },
  ];

  final List<Map<String, String>> _smallPlatesItems = [
    {
      'name': 'Garlic Knots',
      'desc': 'Soft dough knots tossed with garlic butter and parsley.',
      'price': '₹350',
    },
    {
      'name': 'Burrata Caprese',
      'desc':
          'Creamy burrata, heirloom tomatoes, fresh pesto, and balsamic glaze.',
      'price': '₹650',
    },
    {
      'name': 'Arancini',
      'desc':
          'Crispy risotto balls filled with fontina cheese and served with marinara.',
      'price': '₹550',
    },
    {
      'name': 'Wood-Fired Olives',
      'desc': 'Warm olive medley with orange zest and fresh herbs.',
      'price': '₹350',
    },
  ];
}
