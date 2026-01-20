import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

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
              _footerLink('Menu'),
              _footerLink('About'),
              _footerLink('Gallery'),
              _footerLink('Order'),
              _footerLink('Contact'),
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
                '123 Artisan Lane,\nBakery District, City 560001',
              ),
              _footerContactItem(Icons.phone_outlined, '+91 98765 43210'),
              _footerContactItem(Icons.camera_alt_outlined, '@grove_pizzeria'),
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
        // _footerHeader('EXPLORE'),
        // _footerLink('Menu'),
        // _footerLink('About'),
        // _footerLink('Gallery'),
        // _footerLink('Order'),
        // _footerLink('Contact'),
        // const SizedBox(height: 48),
        _footerHeader('VISIT THE GROVE'),
        _footerContactItem(
          Icons.location_on_outlined,
          '123 Artisan Lane,\nBakery District, City 560001',
        ),
        _footerContactItem(Icons.phone_outlined, '+91 98765 43210'),
        _footerContactItem(Icons.camera_alt_outlined, '@grove_pizzeria'),
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
      'Authentic wood-fired pizzas crafted with love, served in the heart of the neighborhood.',
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

  Widget _footerLink(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {},
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

  Widget _footerContactItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
