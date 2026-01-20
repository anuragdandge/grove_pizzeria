import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

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
        double horizontalPadding = isSmallScreen ? 24 : 120;

        return PageScaffold(
          activeSection: 'order',
          child: Column(
            children: [
              _buildHeroSection(context, isSmallScreen, horizontalPadding),
              _buildDeliverySection(context, isSmallScreen, horizontalPadding),
              _buildBulkOrderSection(context, isSmallScreen, horizontalPadding),
              _buildQuoteSection(context, isSmallScreen, horizontalPadding),
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
        40,
      ),
      child: Column(
        crossAxisAlignment: isSmallScreen
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(
            'ORDER ONLINE',
            textAlign: isSmallScreen ? TextAlign.left : TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isSmallScreen ? double.infinity : 800,
            child: Text(
              'Bring the Grove Home',
              textAlign: isSmallScreen ? TextAlign.left : TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: isSmallScreen ? 48 : 64,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: AppColors.groveEspresso,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: isSmallScreen ? double.infinity : 600,
            child: Text(
              'Can\'t make it to us? We\'ll bring the fire to you. Order through your preferred delivery partner.',
              textAlign: isSmallScreen ? TextAlign.left : TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isSmallScreen ? 16 : 18,
                height: 1.7,
              ),
            ),
          ),
          const SizedBox(height: 60),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              'assets/hero-pizza.jpg',
              width: isSmallScreen ? double.infinity : 800,
              height: isSmallScreen ? 180 : 350,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverySection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    const swiggyLink =
        'https://www.swiggy.com/city/pune/grove-pizzeria-baner-baner-rest1244177?utm_source=GooglePlaceOrder&utm_campaign=GoogleMap&is_retargeting=true&media_source=GooglePlaceOrder';
    const zomatoLink = 'https://www.zomato.com/pune/grove-pizzeria-baner/order';

    if (isSmallScreen) {
      return Container(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          20,
          horizontalPadding,
          40,
        ),
        child: Column(
          children: [
            _buildDeliveryCard(
              context,
              'Swiggy',
              'Get it delivered fast via Swiggy. Quick, reliable, and piping hot.',
              const Color(0xFFFC8019),
              'S',
              swiggyLink,
            ),
            const SizedBox(height: 32),
            _buildDeliveryCard(
              context,
              'Zomato',
              'Order your favorites via Zomato. Trusted delivery, every time.',
              const Color(0xFFE23744),
              'Z',
              zomatoLink,
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          40,
          horizontalPadding,
          80,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _buildDeliveryCard(
                context,
                'Swiggy',
                'Get it delivered fast via Swiggy. Quick, reliable, and piping hot.',
                const Color(0xFFFC8019),
                'S',
                swiggyLink,
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
              child: _buildDeliveryCard(
                context,
                'Zomato',
                'Order your favorites via Zomato. Trusted delivery, every time.',
                const Color(0xFFE23744),
                'Z',
                zomatoLink,
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildDeliveryCard(
    BuildContext context,
    String partner,
    String desc,
    Color brandColor,
    String initial,
    String url,
  ) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.groveCreamLight.withValues(alpha: 0.3),
        border: Border.all(
          color: AppColors.groveEspresso.withValues(alpha: 0.05),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: brandColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              initial,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Order via $partner',
            style: GoogleFonts.josefinSans(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.groveEspresso,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: AppColors.groveEspresso.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 32),
          InkWell(
            onTap: () => _launchURL(url),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.groveHoney.withValues(alpha: 0.7),
                border: Border.all(
                  color: AppColors.groveEspresso.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ORDER ON ${partner.toUpperCase()}',
                    style: GoogleFonts.josefinSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: AppColors.groveEspresso,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.open_in_new,
                    size: 14,
                    color: AppColors.groveEspresso,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulkOrderSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: horizontalPadding,
      ),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.8),
            ),
            children: [
              const TextSpan(
                text: 'For bulk orders, catering, or special requests, please ',
              ),
              WidgetSpan(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/contact'),
                    child: const Text(
                      'contact us directly',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuoteSection(
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
      child: Center(
        child: SizedBox(
          width: 800,
          child: Text(
            '"Distance shouldn\'t keep you from wood-fired perfection."',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 24 : 36,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveCream,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
