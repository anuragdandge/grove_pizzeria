import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      activeSection: 'menu',
      child: Column(children: [_buildMenuSection(context)]),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Column(
        children: [
          Text(
            'THE MENU',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
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
                      'RED BASE',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 40),
                    _buildMenuItem(
                      context,
                      'MARGHERITA',
                      'San Marzano tomatoes, fior di latte, basil, EVOO',
                      '₹550',
                    ),
                    _buildMenuItem(
                      context,
                      'MARINARA',
                      'San Marzano tomatoes, garlic, oregano, EVOO',
                      '₹450',
                    ),
                    _buildMenuItem(
                      context,
                      'DIAVOLA',
                      'Spicy salami, San Marzano, fior di latte, chili',
                      '₹750',
                    ),
                    _buildMenuItem(
                      context,
                      'BURRATA',
                      'San Marzano, fresh burrata, arugula, balsamic',
                      '₹850',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 80),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WHITE BASE',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 40),
                    _buildMenuItem(
                      context,
                      'QUATTRO FORMAGGI',
                      'Gorgonzola, mozzarella, fontina, parmigiano',
                      '₹800',
                    ),
                    _buildMenuItem(
                      context,
                      'TARTUFO',
                      'Black truffle cream, mushrooms, mozzarella',
                      '₹950',
                    ),
                    _buildMenuItem(
                      context,
                      'VERDURE',
                      'Zucchini, roasted peppers, spinach, garlic',
                      '₹700',
                    ),
                    _buildMenuItem(
                      context,
                      'PISTACCHIO',
                      'Pistachio pesto, mortadella, mozzarella',
                      '₹900',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 120),
          Column(
            children: [
              Text(
                'Chef\'s Special',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 40),
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?q=80&w=1935&auto=format&fit=crop',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String name,
    String ingredients,
    String price,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ingredients,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.groveEspresso.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
