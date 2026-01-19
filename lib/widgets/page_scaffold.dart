import 'package:flutter/material.dart';
import 'package:grove_pizzeria/widgets/navbar.dart';
import 'package:grove_pizzeria/widgets/footer.dart';

class PageScaffold extends StatelessWidget {
  final Widget child;
  final String activeSection;

  const PageScaffold({
    super.key,
    required this.child,
    required this.activeSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(
              activeSection: activeSection,
              onNavItemTap: (section) {
                if (section == activeSection) return;
                Navigator.of(context).pushNamed('/$section');
              },
            ),
            child,
            const Footer(),
          ],
        ),
      ),
    );
  }
}
