import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';
import 'package:grove_pizzeria/widgets/page_scaffold.dart';
import 'package:grove_pizzeria/widgets/custom_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
          activeSection: 'contact',
          child: Column(
            children: [
              _buildHeaderSection(context, isSmallScreen, horizontalPadding),
              _buildContactAndFormSection(
                context,
                isSmallScreen,
                horizontalPadding,
              ),
              _buildMapSection(context, isSmallScreen, horizontalPadding),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONTACT',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.groveEspresso.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Visit the Grove',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 48 : 64,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.groveEspresso,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Text(
                  'We\'d love to see you. Drop by for a slice, give us a ring, or send a message—we\'re all ears.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isSmallScreen ? 16 : 18,
                    height: 1.7,
                  ),
                ),
              ),
              if (!isSmallScreen) ...[
                const SizedBox(width: 40),
                PrimaryButton(
                  text: 'BOOK A TABLE',
                  onTap: () => _launchURL(
                    'https://www.google.com/maps/reserve/v/dine/c/uV5GJSx1lCk?source=pa&opi=89978449&hl=en-IN&gei=QMtvaa23NML31e8Pyb_PCQ&sourceurl=https://www.google.com/search?client%3Dfirefox-b-d%26q%3Dgrove%2Bpizzeria%26sei%3DNctvadCCIPLW1e8PtOuc8AQ%26dlnr%3D1',
                  ),
                ),
              ],
            ],
          ),
          if (isSmallScreen) ...[
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: 'BOOK A TABLE',
                onTap: () => _launchURL(
                  'https://www.google.com/maps/reserve/v/dine/c/uV5GJSx1lCk?source=pa&opi=89978449&hl=en-IN&gei=QMtvaa23NML31e8Pyb_PCQ&sourceurl=https://www.google.com/search?client%3Dfirefox-b-d%26q%3Dgrove%2Bpizzeria%26sei%3DNctvadCCIPLW1e8PtOuc8AQ%26dlnr%3D1',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactAndFormSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    if (isSmallScreen) {
      return Container(
        padding: EdgeInsets.fromLTRB(
          horizontalPadding,
          20,
          horizontalPadding,
          60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactInfoList(context),
            const SizedBox(height: 60),
            _buildInquiryForm(context, isSmallScreen),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 4, child: _buildContactInfoList(context)),
            const SizedBox(width: 80),
            Expanded(flex: 6, child: _buildInquiryForm(context, isSmallScreen)),
          ],
        ),
      );
    }
  }

  Widget _buildContactInfoList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(
          context,
          Icons.location_on_outlined,
          'Visit the Grove',
          'Shop 1, Venkatesh Society\nNear Zudio, Baner Road, Baner\nPune, Maharashtra 411045',
          onTap: () => _launchURL('https://maps.app.goo.gl/MeLECRNAMo2CdZH69'),
        ),
        _buildContactItem(
          context,
          Icons.phone_outlined,
          'Ring the Bell',
          '+91 96076 01217',
          onTap: () => _launchURL('tel:+919607601217'),
        ),
        _buildContactItem(
          context,
          Icons.access_time_outlined,
          'Hours',
          'Monday – Sunday\n12:00 PM – 10:30 PM',
        ),
        _buildContactItem(
          context,
          Icons.camera_alt_outlined,
          'Follow Along',
          '@grove_pizzeria',
          onTap: () => _launchURL('https://www.instagram.com/grove_pizzeria'),
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: MouseRegion(
        cursor: onTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.groveHoney.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppColors.groveEspresso, size: 20),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.josefinSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.groveEspresso,
                        decoration: onTap != null
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: AppColors.groveEspresso.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.groveEspresso.withValues(alpha: 0.7),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInquiryForm(BuildContext context, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send an Inquiry',
          style: GoogleFonts.playfairDisplay(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.groveEspresso,
          ),
        ),
        const SizedBox(height: 40),
        if (isSmallScreen) ...[
          _buildFormLabel('NAME'),
          _buildTextField('Your name'),
          const SizedBox(height: 24),
          _buildFormLabel('EMAIL'),
          _buildTextField('your@email.com'),
        ] else
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormLabel('NAME'),
                    _buildTextField('Your name'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFormLabel('EMAIL'),
                    _buildTextField('your@email.com'),
                  ],
                ),
              ),
            ],
          ),
        const SizedBox(height: 24),
        _buildFormLabel('SUBJECT'),
        _buildTextField('What\'s this about?'),
        const SizedBox(height: 24),
        _buildFormLabel('MESSAGE'),
        _buildTextField('Tell us more...', maxLines: 5),
        const SizedBox(height: 40),
        SizedBox(
          width: isSmallScreen ? double.infinity : null,
          child: PrimaryButton(text: 'SEND MESSAGE', onTap: () {}),
        ),
      ],
    );
  }

  Widget _buildFormLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        label,
        style: GoogleFonts.josefinSans(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: AppColors.groveEspresso.withValues(alpha: 0.6),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.groveEspresso.withValues(alpha: 0.3),
          fontSize: 14,
        ),
        filled: true,
        fillColor: AppColors.groveHoney.withValues(alpha: 0.1),
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.groveEspresso.withValues(alpha: 0.1),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.groveHoney, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _buildMapSection(
    BuildContext context,
    bool isSmallScreen,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        horizontalPadding,
        40,
        horizontalPadding,
        80,
      ),
      child: InkWell(
        onTap: () => _launchURL('https://maps.app.goo.gl/MeLECRNAMo2CdZH69'),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
          decoration: BoxDecoration(
            color: AppColors.groveHoney.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.groveHoneyDark,
                size: 48,
              ),
              const SizedBox(height: 24),
              Text(
                'Shop 1, Venkatesh Society, Baner',
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.groveEspresso,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Click here to view on Google Maps',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.groveEspresso.withValues(alpha: 0.5),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
