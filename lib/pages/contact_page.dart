import 'package:flutter/material.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      activeSection: 'contact',
      child: Column(children: [_buildContactSection(context)]),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CONTACT US',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.groveEspresso.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Get in Touch',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 64),
                _buildContactInfo(
                  context,
                  'ADDRESS',
                  '123 Artisan Lane, Bakery District, City 560001',
                ),
                _buildContactInfo(context, 'PHONE', '+91 98765 43210'),
                _buildContactInfo(
                  context,
                  'HOURS',
                  'Mon - Sun: 11:30 AM - 11:00 PM',
                ),
                const SizedBox(height: 40),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.groveEspresso.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.groveEspresso.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Interactive map coming soon',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: AppColors.groveEspresso.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 110),
                Text(
                  'Send an Inquiry',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 40),
                _buildTextField(context, 'FULL NAME'),
                const SizedBox(height: 24),
                _buildTextField(context, 'EMAIL ADDRESS'),
                const SizedBox(height: 24),
                _buildTextField(context, 'MESSAGE', maxLines: 5),
                const SizedBox(height: 48),
                PrimaryButton(text: 'SEND MESSAGE', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    String label, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12),
        ),
        const SizedBox(height: 12),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.groveEspresso.withValues(alpha: 0.02),
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.groveEspresso.withValues(alpha: 0.1),
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.groveHoney),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}
