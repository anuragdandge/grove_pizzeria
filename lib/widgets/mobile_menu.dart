import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';

class MobileMenu extends StatelessWidget {
  final Function(String) onNavItemTap;
  final String activeSection;

  const MobileMenu({
    super.key,
    required this.onNavItemTap,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.groveCream,
      width: MediaQuery.of(context).size.width,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Logo and Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GROVE',
                    style: GoogleFonts.josefinSans(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      color: AppColors.groveEspresso,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.groveEspresso,
                      size: 32,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // Navigation Items
              _mobileNavItem(context, 'HOME', activeSection == 'home'),
              _mobileNavItem(context, 'ABOUT', activeSection == 'about'),
              _mobileNavItem(context, 'MENU', activeSection == 'menu'),
              _mobileNavItem(context, 'GALLERY', activeSection == 'gallery'),
              _mobileNavItem(context, 'ORDER', activeSection == 'order'),
              _mobileNavItem(context, 'CONTACT', activeSection == 'contact'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mobileNavItem(BuildContext context, String label, bool isActive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
            onNavItemTap(label.toLowerCase());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              label,
              style: GoogleFonts.josefinSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                color: AppColors.groveEspresso,
              ),
            ),
          ),
        ),
        if (isActive)
          Container(
            height: 1,
            width: double.infinity,
            color: AppColors.groveEspresso.withOpacity(0.8),
          ),
      ],
    );
  }
}
