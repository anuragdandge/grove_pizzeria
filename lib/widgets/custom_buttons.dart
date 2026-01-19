import 'package:flutter/material.dart';
import 'package:grove_pizzeria/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setBtnState) {
        return MouseRegion(
          onEnter: (_) => setBtnState(() => isHovered = true),
          onExit: (_) => setBtnState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: isHovered
                    ? AppColors.groveHoneyDark
                    : AppColors.groveHoney,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(text, style: Theme.of(context).textTheme.labelLarge),
            ),
          ),
        );
      },
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const SecondaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setBtnState) {
        return MouseRegion(
          onEnter: (_) => setBtnState(() => isHovered = true),
          onExit: (_) => setBtnState(() => isHovered = false),
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: isHovered
                    ? AppColors.groveCream.withValues(alpha: 0.1)
                    : Colors.transparent,
                border: Border.all(color: AppColors.groveCream, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                text,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: AppColors.groveCream),
              ),
            ),
          ),
        );
      },
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const OutlineButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.groveEspresso, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(text, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(width: 12),
            const Icon(Icons.arrow_forward, size: 16),
          ],
        ),
      ),
    );
  }
}
