import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';

enum CustomButtonVariant { primary, secondary, outline, text }

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final CustomButtonVariant variant;
  final bool fullWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.variant = CustomButtonVariant.primary,
    this.fullWidth = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    Color bgColor;
    Color textColor;
    BorderSide borderSide = BorderSide.none;

    switch (widget.variant) {
      case CustomButtonVariant.primary:
        bgColor = isDark ? AppColors.primaryDark : AppColors.primaryLight;
        textColor = Colors.white;
        if (_isHovered) {
          bgColor = isDark ? AppColors.primaryHoverDark : AppColors.primaryHoverLight;
        }
        break;
      case CustomButtonVariant.secondary:
        bgColor = isDark ? AppColors.surfaceSubtleDark : AppColors.surfaceSubtleLight;
        textColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
        if (_isHovered) {
          bgColor = isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0);
        }
        break;
      case CustomButtonVariant.outline:
        bgColor = Colors.transparent;
        textColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
        borderSide = BorderSide(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 1.5,
        );
        if (_isHovered) {
          bgColor = isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9);
          borderSide = BorderSide(
            color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
            width: 1.5,
          );
        }
        break;
      case CustomButtonVariant.text:
        bgColor = Colors.transparent;
        textColor = isDark ? AppColors.primaryDark : AppColors.primaryLight;
        if (_isHovered) {
          bgColor = isDark ? const Color(0xFF1E293B) : const Color(0xFFF0F9FF);
        }
        break;
    }

    final buttonChild = Row(
      mainAxisSize: widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, size: 18, color: textColor),
          const SizedBox(width: 8),
        ],
        Text(
          widget.text,
          style: theme.textTheme.labelLarge?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );

    BoxDecoration decoration = BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10.0),
      border: borderSide != BorderSide.none
          ? Border.fromBorderSide(borderSide)
          : null,
      boxShadow: widget.variant == CustomButtonVariant.primary
          ? [
              BoxShadow(
                color: isDark
                    ? AppColors.primaryDark.withValues(alpha: _isHovered ? 0.35 : 0.2)
                    : AppColors.primaryLight.withValues(alpha: _isHovered ? 0.35 : 0.2),
                blurRadius: _isHovered ? 16 : 8,
                offset: const Offset(0, 4),
              )
            ]
          : null,
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
        decoration: decoration,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22.0, vertical: 14.0),
              child: buttonChild,
            ),
          ),
        ),
      ),
    );
  }
}
