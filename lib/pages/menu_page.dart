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
              'Every pizza is hand-stretched, wood-fired, and made with love. Our menu celebrates authentic sourdough Neapolitan traditions.',
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
          _buildMenuCategory(
            context,
            'Pizzas (Sourdough)',
            _pizzaItems,
            isSmallScreen,
          ),
          const SizedBox(height: 60),
          _buildMenuCategory(
            context,
            'Pasta & Ravioli',
            _pastaItems,
            isSmallScreen,
          ),
          const SizedBox(height: 60),
          _buildMenuCategory(
            context,
            'Appetizers & Sides',
            _appetizerItems,
            isSmallScreen,
          ),
          const SizedBox(height: 60),
          _buildMenuCategory(context, 'Desserts', _dessertItems, isSmallScreen),
          const SizedBox(height: 60),
          _buildMenuCategory(
            context,
            'Beverages',
            _beveragesItems,
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
                    isVeg: item['isVeg'] == 'true',
                    isPopular: item['isPopular'] == 'true',
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
    String price, {
    bool isVeg = false,
    bool isPopular = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (isVeg)
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1),
                        ),
                        child: const Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.green,
                        ),
                      )
                    else
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 1),
                        ),
                        child: const Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.red,
                        ),
                      ),
                    Text(
                      name,
                      style: GoogleFonts.josefinSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.groveEspresso,
                      ),
                    ),
                    if (isPopular)
                      Container(
                        margin: const EdgeInsets.only(left: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.groveHoney.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          'POPULAR',
                          style: GoogleFonts.josefinSans(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.groveHoneyDark,
                          ),
                        ),
                      ),
                  ],
                ),
                if (desc.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    desc,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.groveEspresso.withValues(alpha: 0.7),
                      fontSize: 14,
                    ),
                  ),
                ],
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
      color: AppColors.groveCream,
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
            'Pesto Cherry\nTomato Pizza',
            'A customer favorite featuring homemade pesto, fresh mozzarella, sundried tomatoes, and parmesan. Our signature sourdough crust makes it unforgettable.',
            '₹419',
            'assets/margherita-pizza.jpg', // Reusing asset
            isSmallScreen,
            isReversed: false,
          ),
          SizedBox(height: isSmallScreen ? 80 : 120),
          _buildSpecialItem(
            context,
            'Spaghetti Alla\nCarbonara',
            'Highly recommended authentic flavor. Spaghetti tossed in creamy egg yolk, parmesan, bacon, and black pepper. A true Italian soul dish.',
            '₹629',
            'assets/truffle-pizza.jpg', // Reusing asset
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
          'Available all day',
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
                  'The Heart of Sourdough',
                  'Discover why our Neapolitan sourdough crust has become a Baner favorite.',
                ),
                const SizedBox(height: 32),
                _buildJournalCard(
                  context,
                  'SEP 28, 2025',
                  'From Italy to Pune',
                  'Our journey of bringing authentic sourdough pizzas to the neighborhood.',
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
                    'The Heart of Sourdough',
                    'Discover why our Neapolitan sourdough crust has become a Baner favorite.',
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: _buildJournalCard(
                    context,
                    'SEP 28, 2025',
                    'From Italy to Pune',
                    'Our journey of bringing authentic sourdough pizzas to the neighborhood.',
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

  final List<Map<String, String>> _pizzaItems = [
    {
      'name': 'Shrooms (Veg)',
      'desc':
          'San Marzano sauce, fresh mozzarella, braised mushrooms, arugula, goat cheese, balsamic glaze.',
      'price': '₹469',
      'isVeg': 'true',
      'isPopular': 'true',
    },
    {
      'name': 'Pesto Cherry Tomato',
      'desc':
          'White sauce base with cheddar, smoked gouda, fresh mozzarella, black olives, red paprika, and blue cheese.',
      'price': '₹419',
      'isVeg': 'true',
      'isPopular': 'true',
    },
    {
      'name': 'Traditional Margarita',
      'desc':
          'Classic San Marzano sauce, homemade fresh mozzarella, basil, parmesan, and EVOO.',
      'price': '₹379',
      'isVeg': 'true',
      'isPopular': 'false',
    },
    {
      'name': 'Pesto Chicken',
      'desc':
          'Homemade pesto, fresh mozzarella, chicken, jalapenos, sundried tomato, and parsley.',
      'price': '₹379',
      'isVeg': 'false',
      'isPopular': 'false',
    },
    {
      'name': 'Classic Pepperoni',
      'desc':
          'San Marzano sauce, fresh mozzarella, pepperoni, and parmesan cheese.',
      'price': '₹379',
      'isVeg': 'false',
      'isPopular': 'true',
    },
    {
      'name': 'Ham and Cheese',
      'desc':
          'San Marzano sauce, cheddar, chicken/pork ham, parmesan, and capers.',
      'price': '₹459',
      'isVeg': 'false',
      'isPopular': 'false',
    },
    {
      'name': 'Grilled Chicken',
      'desc':
          'San Marzano sauce, grilled chicken, caramelized onion, smoked paprika, and cheese spread.',
      'price': '₹409',
      'isVeg': 'false',
      'isPopular': 'false',
    },
  ];

  final List<Map<String, String>> _pastaItems = [
    {
      'name': 'Marinara Fusilli',
      'desc':
          'Classic fusilli coated with fresh marinara sauce, basil & fresh mozzarella.',
      'price': '₹479',
      'isVeg': 'true',
      'isPopular': 'false',
    },
    {
      'name': 'Ravioli Ai Quattro Formaggi',
      'desc':
          'In-house ravioli stuffed with 4 types of cheese served with sage burnt butter sauce.',
      'price': '₹579',
      'isVeg': 'true',
      'isPopular': 'false',
    },
    {
      'name': 'Chicken & Sun-dried Tomato Tortellini',
      'desc':
          'Tortellini stuffed with sundried tomatoes, chicken & mushroom served with broth & parmesan.',
      'price': '₹599',
      'isVeg': 'false',
      'isPopular': 'false',
    },
    {
      'name': 'Broccoli & Walnut Ravioli',
      'desc':
          'Stuffed with broccoli & walnut, served with smokey pumpkin sauce.',
      'price': '₹639',
      'isVeg': 'true',
      'isPopular': 'false',
    },
    {
      'name': 'Spaghetti Alla Carbonara',
      'desc':
          'Spaghetti tossed in creamy egg yolk, parmesan, bacon, and black pepper.',
      'price': '₹629',
      'isVeg': 'false',
      'isPopular': 'true',
    },
    {
      'name': 'Aglio-e-olio',
      'desc':
          'Traditional spaghetti with olive oil, paprika, parsley, olives & sun-dried tomatoes.',
      'price': '₹449',
      'isVeg': 'true',
      'isPopular': 'false',
    },
  ];

  final List<Map<String, String>> _appetizerItems = [
    {
      'name': 'Garlic Bread With Cheese',
      'desc':
          'Garlic butter, homemade fresh buffalo mozzarella, fresh parsley, olive oil.',
      'price': '₹309',
      'isVeg': 'true',
      'isPopular': 'true',
    },
    {
      'name': 'Classic Garlic Bread',
      'desc': 'Garlic butter, fresh parsley, olive oil.',
      'price': '₹229',
      'isVeg': 'true',
      'isPopular': 'false',
    },
  ];

  final List<Map<String, String>> _dessertItems = [
    {
      'name': 'Tiramisu',
      'desc': 'Classic Italian dessert with mascarpone and coffee.',
      'price': '₹350',
      'isVeg': 'true',
      'isPopular': 'true',
    },
    {
      'name': 'Mix Berry Cheesecake',
      'desc': 'Creamy cheesecake with berry topping.',
      'price': '₹259',
      'isVeg': 'true',
      'isPopular': 'false',
    },
  ];

  final List<Map<String, String>> _beveragesItems = [
    {
      'name': 'Hot Chocolate',
      'desc': 'Rich and creamy hot chocolate.',
      'price': '₹249',
      'isVeg': 'true',
      'isPopular': 'false',
    },
    {
      'name': 'Cappuccino',
      'desc': 'Classic italian coffee.',
      'price': '₹229',
      'isVeg': 'true',
      'isPopular': 'false',
    },
    {
      'name': 'Cafe Latte',
      'desc': '',
      'price': '₹229',
      'isVeg': 'true',
      'isPopular': 'false',
    },
    {
      'name': 'Lemon Green Tea',
      'desc': '',
      'price': '₹119',
      'isVeg': 'true',
      'isPopular': 'false',
    },
  ];
}
