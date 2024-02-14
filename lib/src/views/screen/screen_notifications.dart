import 'package:flutter/material.dart';
import 'package:laam_notification/src/views/components/card_notification_membership.dart';
import 'package:laam_notification/src/views/components/card_notification_message.dart';
import 'package:laam_notification/src/views/components/card_notification_order.dart';
import 'package:laam_notification/src/views/components/card_notification_request.dart';
import 'package:laam_notification/src/views/components/card_notification_task.dart';

class ScreenMobileNotification extends StatefulWidget {
  const ScreenMobileNotification({super.key});

  @override
  State<ScreenMobileNotification> createState() =>
      _ScreenMobileNotificationState();
}

class _ScreenMobileNotificationState extends State<ScreenMobileNotification> {
  List todayItem = [
    NotificationMessageCard(
      onTapProfile: () {},
      title: 'New Message',
      content: 'This is the descriptions',
      timeStamp: DateTime.now(),
      image: const NetworkImage(
          'https://media.istockphoto.com/id/1488678095/photo/mid-adult-latin-man-smiling-pointing-to-the-side-showing-copy-blank-space-isolated-over-blue.jpg?s=1024x1024&w=is&k=20&c=B7q5P51lDZtn11V8guNn_0OaC9GgivjwV6hTLNmpY48='),
    ),
    NotificationOrderCard(
        title: "New Order",
        content: 'this is the description',
        image: const NetworkImage(
            'https://media.istockphoto.com/id/1474040534/fr/photo/homme-adulte-mi-latin-surpris-en-t-shirt-en-jean-mains-sur-visage-isol%C3%A9-sur-fond-bleu-homme.jpg?s=1024x1024&w=is&k=20&c=-VoX3z1fro87RSsoaf9HXD4_i0bLyYyocBzOa-QvIv8='),
        onTapProfile: () {},
        timeStamp: DateTime.now()),
    NotificationTaskCard(
        title: 'New Task',
        content: 'for imformation click here',
        image: const NetworkImage(
            'https://media.istockphoto.com/id/1447156216/fr/photo/portrait-p%C3%A8re-et-gar%C3%A7on-heureux-sourire-dans-le-plaisir-du-jardin-vacances-et-pause-dans-le.jpg?s=1024x1024&w=is&k=20&c=HfH0QjkLZcMYnZR-RjnqkUxMDbLCscJGWVs_5mWTzpc='),
        onTapProfile: () {},
        timeStamp: DateTime.now()),
    NotificationRequestCard(
        title: "New Request",
        content: "This is the description",
        image: const NetworkImage(
            'https://media.istockphoto.com/id/1448683848/fr/photo/selfie-amour-et-jardin-avec-un-couple-noir-prenant-une-photo-tout-en-se-tenant-ensemble-%C3%A0.jpg?s=1024x1024&w=is&k=20&c=tO787H1ELBKJAaWjJWXll1qlbIUXO41SWKEU5HCru_o='),
        onTapProfile: () {},
        timeStamp: DateTime.now()),
    NotificationMembershipCard(
        title: "Membership",
        content: 'this is the description',
        image: const NetworkImage(
            'https://media.istockphoto.com/id/1438969575/fr/photo/un-jeune-%C3%A9tudiant-souriant-portant-des-%C3%A9couteurs-debout-dans-une-salle-de-classe.jpg?s=1024x1024&w=is&k=20&c=wMXUSR7DSVjru7obqdJCc-mNcJqlgRbyu88UYP4qFC4='),
        onTapProfile: () {},
        timeStamp: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final notificationChild = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _storyTitle(theme, 'Today'),
        _todayNotifications(),
        const SizedBox(height: 15),
      ],
    );
    final notifications = SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: notificationChild,
      ),
    );
    final body = CustomScrollView(
      slivers: [notifications],
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          title: Text(
            'Notifications (${todayItem.length})',
            style: theme.textTheme.bodyLarge,
          ),
        ),
        body: body,
      ),
    );
  }

  Text _storyTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleMedium!.copyWith(
        color: theme.brightness == Brightness.dark
            ? theme.indicatorColor
            : theme.primaryColor,
      ),
    );
  }

  ListView _todayNotifications() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: todayItem.length,
        itemBuilder: (context, index) {
          return todayItem[index];
        });
  }
}
