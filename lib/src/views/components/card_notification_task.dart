import 'package:flutter/material.dart';
import 'package:laam_notification/src/views/components/on_hover.dart';
import 'package:laam_notification/src/views/components/profile_circle.dart';
import 'package:laam_notification/src/views/components/time_ago.dart';

class NotificationTaskCard extends StatefulWidget {
  const NotificationTaskCard({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
    required this.onTapProfile,
    required this.timeStamp,
  }) : super(key: key);

  final String title;
  final String content;
  final ImageProvider<Object> image;
  final VoidCallback onTapProfile;
  final DateTime timeStamp;

  @override
  State<NotificationTaskCard> createState() => _NotificationTaskCardState();
}

class _NotificationTaskCardState extends State<NotificationTaskCard> {
  bool isMobile(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width < 600;
  }

  bool isNotificationOopened = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timeAgo = timeAgoSinceDate(widget.timeStamp, context);

    final statusDot = Padding(
      padding: const EdgeInsets.only(top: 8),
      child: isNotificationOopened ? const SizedBox() : _dot(theme),
    );

    final notificationTitle = Text(
      widget.title,
      style: theme.textTheme.bodyMedium
          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
      maxLines: 1,
    );

    var description = Text(
      widget.content,
      style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
      maxLines: 1,
    );
    var timeStamp = Text(
      timeAgo,
      style:
          theme.textTheme.bodySmall?.copyWith(color: Colors.grey, fontSize: 12),
    );
    final notificationContent = Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [notificationTitle, description, timeStamp],
      ),
    );

    var profileCircle = ProfileCircle(
      image: widget.image,
      onTap: widget.onTapProfile,
      notificationTypeIcon: Icons.task_alt,
    );
    final profileAndDetails = Row(
      children: [profileCircle, notificationContent],
    );

    return OnHover(builder: (isHovered) {
      final color = isHovered
          ? theme.brightness == Brightness.dark
              ? Colors.grey[800]
              : Colors.grey[200]
          : theme.brightness != Brightness.light
              ? theme.cardColor
              : theme.cardColor;

      return GestureDetector(
        onTap: () {
          setState(() {
            isNotificationOopened = true;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            border: !isMobile(context)
                ? theme.brightness == Brightness.light
                    ? Border(bottom: BorderSide(color: Colors.grey.shade200))
                    : Border.all(color: Colors.transparent)
                : Border.all(color: Colors.transparent),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [profileAndDetails, const Spacer(), statusDot],
          ),
        ),
      );
    });
  }

  Container _dot(ThemeData theme) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.brightness == Brightness.dark
            ? theme.indicatorColor
            : theme.primaryColor,
      ),
    );
  }
}
