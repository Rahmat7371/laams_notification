import 'package:flutter/material.dart';

class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    super.key,
    required this.image,
    this.onTap,
    this.radius,
    this.backgroundColor,
    this.margin,
    this.padding,
    this.border,
    required this.notificationTypeIcon,
  });

  final ImageProvider<Object> image;
  final VoidCallback? onTap;
  final double? radius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final IconData notificationTypeIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: margin,
            padding: padding,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: radius ?? 30,
              backgroundImage: image,
              backgroundColor: theme.brightness == Brightness.dark
                  ? Colors.grey[700]
                  : Colors.grey[300],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: radius ?? 13,
              child: Icon(
                notificationTypeIcon,
                size: 17,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
