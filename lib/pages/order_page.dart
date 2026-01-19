import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      activeSection: 'order',
      child: Column(children: [_buildOrderSection(context)]),
    );
  }

  Widget _buildOrderSection(BuildContext context) {
    return Container(
      color: AppColors.groveCreamLight.withValues(alpha: 0.5),
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Column(
        children: [
          Text(
            'Bring the Grove Home',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 80),
          Row(
            children: [
              _buildDeliveryCard(
                context,
                'Swiggy',
                'Order through Swiggy for fast delivery within 5km.',
              ),
              const SizedBox(width: 40),
              _buildDeliveryCard(
                context,
                'Zomato',
                'Order through Zomato for exclusive deals and offers.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryCard(BuildContext context, String partner, String desc) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(60),
        decoration: BoxDecoration(
          color: AppColors.groveCream,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.groveEspresso.withValues(alpha: 0.05),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              partner,
              style: GoogleFonts.josefinSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 48),
            PrimaryButton(
              text: 'ORDER ON ${partner.toUpperCase()}',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
