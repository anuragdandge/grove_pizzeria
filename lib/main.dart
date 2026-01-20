import 'package:flutter/material.dart';
import 'package:grove_pizzeria/pages/home_page.dart';
import 'package:grove_pizzeria/pages/about_page.dart';
import 'package:grove_pizzeria/pages/menu_page.dart';
import 'package:grove_pizzeria/pages/gallery_page.dart';
import 'package:grove_pizzeria/pages/order_page.dart';
import 'package:grove_pizzeria/pages/contact_page.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';

void main() {
  runApp(const GrovePizzeria());
}

class GrovePizzeria extends StatelessWidget {
  const GrovePizzeria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GROVE Pizzeria',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/':
          case '/home':
            page = const HomePage();
            break;
          case '/about':
            page = const AboutPage();
            break;
          case '/menu':
            page = MenuPage();
            break;
          case '/gallery':
            page = const GalleryPage();
            break;
          case '/order':
            page = const OrderPage();
            break;
          case '/contact':
            page = const ContactPage();
            break;
          default:
            page = const HomePage();
        }

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
          settings: settings,
        );
      },
    );
  }
}
