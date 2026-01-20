import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';

class Navbar extends StatelessWidget {
  final Function(String) onNavItemTap;
  final String activeSection;

  const Navbar({
    super.key,
    required this.onNavItemTap,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 900;

        return Container(
          height: isSmallScreen ? 80 : 100,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 80),
          color: AppColors.groveCream,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: () => onNavItemTap('home'),
                child: Text(
                  'GROVE',
                  style: GoogleFonts.josefinSans(
                    fontSize: isSmallScreen ? 24 : 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                    color: AppColors.groveEspresso,
                  ),
                ),
              ),

              // Navigation Items or Hamburger Menu
              if (isSmallScreen)
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.groveEspresso),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                )
              else
                Row(
                  children: [
                    _navItem('HOME', activeSection == 'home'),
                    const SizedBox(width: 40),
                    _navItem('ABOUT', activeSection == 'about'),
                    const SizedBox(width: 40),
                    _navItem('MENU', activeSection == 'menu'),
                    const SizedBox(width: 40),
                    _navItem('GALLERY', activeSection == 'gallery'),
                    const SizedBox(width: 40),
                    _navItem('ORDER', activeSection == 'order'),
                    const SizedBox(width: 40),
                    _navItem('CONTACT', activeSection == 'contact'),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _navItem(String label, bool isActive) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setNavItemState) {
        return MouseRegion(
          onEnter: (_) => setNavItemState(() => isHovered = true),
          onExit: (_) => setNavItemState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () => onNavItemTap(label.toLowerCase()),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: GoogleFonts.josefinSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: AppColors.groveEspresso,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 2,
                  width: (isActive || isHovered) ? 24 : 0,
                  color: AppColors.groveEspresso,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
