import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

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

        return Container(
          color: AppColors.groveEspresso,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 30 : 120,
            vertical: isSmallScreen ? 60 : 80,
          ),
          child: Column(
            children: [
              if (isSmallScreen)
                _buildMobileFooter(context)
              else
                _buildDesktopFooter(context),
              const SizedBox(height: 40),
              Divider(
                color: AppColors.groveCream.withOpacity(0.1),
                thickness: 1,
              ),
              const SizedBox(height: 20),
              Text(
                '© 2026 Grove Pizzeria. Crafted with 🔥 and love.',
                style: GoogleFonts.ibarraRealNova(
                  color: AppColors.groveCream.withOpacity(0.5),
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Brand Section
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _brandLogo(),
              const SizedBox(height: 24),
              SizedBox(width: 280, child: _brandDescription(context)),
            ],
          ),
        ),

        // Quick Links
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _footerHeader('EXPLORE'),
              _footerNavLink(context, 'Menu', '/menu'),
              _footerNavLink(context, 'About', '/about'),
              _footerNavLink(context, 'Gallery', '/gallery'),
              _footerNavLink(context, 'Order', '/order'),
              _footerNavLink(context, 'Contact', '/contact'),
            ],
          ),
        ),

        // Contact Section
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _footerHeader('VISIT THE GROVE'),
              _footerContactItem(
                Icons.location_on_outlined,
                'Shop 1, Venkatesh Society,\nNear Zudio, Baner Road, Baner,\nPune, Maharashtra 411045',
                onTap: () =>
                    _launchURL('https://maps.app.goo.gl/MeLECRNAMo2CdZH69'),
              ),
              _footerContactItem(
                Icons.phone_outlined,
                '+91 96076 01217',
                onTap: () => _launchURL('tel:+919607601217'),
              ),
              _footerContactItem(
                Icons.camera_alt_outlined,
                '@grove_pizzeria',
                onTap: () =>
                    _launchURL('https://www.instagram.com/grove_pizzeria'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _brandLogo(),
        const SizedBox(height: 24),
        _brandDescription(context),
        const SizedBox(height: 48),
        _footerHeader('VISIT THE GROVE'),
        _footerContactItem(
          Icons.location_on_outlined,
          'Shop 1, Venkatesh Society,\nNear Zudio, Baner Road, Baner,\nPune, Maharashtra 411045',
          onTap: () => _launchURL('https://maps.app.goo.gl/MeLECRNAMo2CdZH69'),
        ),
        _footerContactItem(
          Icons.phone_outlined,
          '+91 96076 01217',
          onTap: () => _launchURL('tel:+919607601217'),
        ),
        _footerContactItem(
          Icons.camera_alt_outlined,
          '@grove_pizzeria',
          onTap: () => _launchURL('https://www.instagram.com/grove_pizzeria'),
        ),
      ],
    );
  }

  Widget _brandLogo() {
    return Text(
      'GROVE',
      style: GoogleFonts.josefinSans(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: AppColors.groveCream,
      ),
    );
  }

  Widget _brandDescription(BuildContext context) {
    return Text(
      'Authentic sourdough Neapolitan pizzas, handmade pastas, and cozy ambiance in the heart of Baner.',
      style: GoogleFonts.ibarraRealNova(
        color: AppColors.groveCream.withOpacity(0.8),
        height: 1.6,
        fontSize: 16,
      ),
    );
  }

  Widget _footerHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(
        title,
        style: GoogleFonts.josefinSans(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: AppColors.groveCream.withOpacity(0.6),
        ),
      ),
    );
  }

  Widget _footerNavLink(BuildContext context, String label, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Text(
          label,
          style: GoogleFonts.ibarraRealNova(
            color: AppColors.groveCream.withOpacity(0.8),
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _footerContactItem(IconData icon, String text, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.groveHoney, size: 20),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.ibarraRealNova(
                  color: AppColors.groveCream.withOpacity(0.8),
                  fontSize: 16,
                  height: 1.4,
                  decoration: onTap != null
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: AppColors.groveCream.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
