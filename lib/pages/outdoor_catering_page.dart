import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';

class OutdoorCateringPage extends StatelessWidget {
  const OutdoorCateringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 900;
        double horizontalPadding = isSmallScreen ? 24 : 120;

        return PageScaffold(
          activeSection: 'catering',
          child: Column(
            children: [
              _buildHeroSection(context, isSmallScreen, horizontalPadding),
              _buildServiceSection(context, isSmallScreen, horizontalPadding),
              _buildExperienceSection(context, isSmallScreen, horizontalPadding),
              _buildInquirySection(context, isSmallScreen, horizontalPadding),
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
        isSmallScreen ? 60 : 100,
        horizontalPadding,
        60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OUTDOOR CATERING',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'The Grove, Anywhere',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 48 : 72,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveEspresso,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 700,
            child: Text(
              'From intimate garden parties to grand corporate gatherings, we bring our authentic wood-fired experience to your venue. Freshly tossed dough, premium ingredients, and the unmistakable aroma of oakwood fire.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isSmallScreen ? 16 : 20,
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 48),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/pizza_in_making.JPG',
              width: double.infinity,
              height: isSmallScreen ? 300 : 500,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      color: AppColors.groveCream,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: horizontalPadding,
      ),
      child: Column(
        children: [
          Text(
            'What We Offer',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 32 : 40,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveEspresso,
            ),
          ),
          const SizedBox(height: 60),
          if (isSmallScreen)
            Column(
              children: [
                _cateringItem(
                  context,
                  Icons.local_pizza_outlined,
                  'Live Pizza Station',
                  'Our chefs toss and fire pizzas right before your eyes. A sensory experience that your guests will never forget.',
                ),
                const SizedBox(height: 40),
                _cateringItem(
                  context,
                  Icons.restaurant_outlined,
                  'Custom Menus',
                  'Tailor your menu with our range of sourdough pizzas, handmade pastas, and curated salads.',
                ),
                const SizedBox(height: 40),
                _cateringItem(
                  context,
                  Icons.celebration_outlined,
                  'Full Service',
                  'Not just food—we provide professional staff, setup, and service, ensuring a seamless event.',
                ),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _cateringItem(
                    context,
                    Icons.local_pizza_outlined,
                    'Live Pizza Station',
                    'Our chefs toss and fire pizzas right before your eyes. A sensory experience that your guests will never forget.',
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: _cateringItem(
                    context,
                    Icons.restaurant_outlined,
                    'Custom Menus',
                    'Tailor your menu with our range of sourdough pizzas, handmade pastas, and curated salads.',
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: _cateringItem(
                    context,
                    Icons.celebration_outlined,
                    'Full Service',
                    'Not just food—we provide professional staff, setup, and service, ensuring a seamless event.',
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _cateringItem(
    BuildContext context,
    IconData icon,
    String title,
    String desc,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.groveHoney.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.groveHoneyDark, size: 32),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: GoogleFonts.josefinSans(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.groveEspresso,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.groveEspresso.withValues(alpha: 0.7),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: horizontalPadding,
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (!isSmallScreen)
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/picnic.JPG',
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (!isSmallScreen) const SizedBox(width: 60),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'THE EXPERIENCE',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.groveEspresso.withValues(alpha: 0.6),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Crafted for Moments',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: AppColors.groveEspresso,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'We don’t just serve pizza; we create atmosphere. The crackle of wood, the heat of the oven, and the joyful anticipation of a fresh slice. Our mobile setup is designed to be as beautiful as it is functional, fitting perfectly into any high-end event.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      text: 'VIEW CATERING MENU',
                      onTap: () => Navigator.pushNamed(context, '/menu'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInquirySection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      color: AppColors.groveEspresso,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: horizontalPadding,
      ),
      child: Column(
        children: [
          Text(
            'Plan Your Event',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 36 : 48,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveCream,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Ready to bring the fire to your next gathering? Contact us for a custom quote.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.groveCream.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 48),
          PrimaryButton(
            text: 'SEND CATERING INQUIRY',
            onTap: () => Navigator.pushNamed(context, '/contact'),
          ),
        ],
      ),
    );
  }
}
