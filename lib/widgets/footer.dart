import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.groveEspresso,
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Section
              SizedBox(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GROVE',
                      style: GoogleFonts.josefinSans(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        color: AppColors.groveCream,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Authentic wood-fired pizzas crafted with love, served in the heart of the neighborhood.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.groveCream.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),

              // Quick Links
              Column(
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

              // Contact Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerHeader('VISIT THE GROVE'),
                  _footerContactItem(
                    Icons.location_on_outlined,
                    '123 Artisan Lane,\nBakery District, City 560001',
                  ),
                  _footerContactItem(Icons.phone_outlined, '+91 98765 43210'),
                  _footerContactItem(
                    Icons.camera_alt_outlined,
                    '@grove_pizzeria',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 80),
          Divider(color: AppColors.groveCream.withValues(alpha: 0.1)),
          const SizedBox(height: 40),
          Text(
            '© 2026 Grove Pizzeria. Crafted with 🔥 and love.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.groveCream.withValues(alpha: 0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Text(
        title,
        style: GoogleFonts.josefinSans(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          color: AppColors.groveCream,
        ),
      ),
    );
  }

  Widget _footerLink(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        label,
        style: TextStyle(
          color: AppColors.groveCream.withValues(alpha: 0.8),
          fontSize: 16,
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
          Text(
            text,
            style: TextStyle(
              color: AppColors.groveCream.withValues(alpha: 0.8),
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
