import 'package:flutter/material.dart';

class ButtonCircle extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final double size;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double iconSize;
  final bool enableIconColor;
  final bool isLoading;

  const ButtonCircle.buttonCircle({
    required this.icon,
    this.onPressed,
    super.key,
    this.size = 60,
    this.iconSize = 30,
    this.enableIconColor = true,
    this.isLoading = false,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final child = isLoading
        ? const CircularProgressIndicator()
        : Icon(
            icon,
            size: iconSize,
            color: enableIconColor ? theme.cardColor : null,
          );

    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: margin,
        child: Ink(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: onPressed == null ? theme.disabledColor : theme.primaryColor,
            shape: BoxShape.circle,
          ),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(10.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
