import 'package:flutter/material.dart';
import 'package:laam_notification/src/views/components/notification_overlay.dart';
import 'package:laam_notification/src/views/screen/screen_notifications.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

bool isMobile(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  return mediaQuery.size.width < 600;
}

class _HomeState extends State<Home> {
  final OverlayPortalController portalController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: Text('Home Screen')),
          isMobile(context)
              ? Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) =>
                              const ScreenMobileNotification(),
                        ),
                      );
                    },
                    child: const Icon(Icons.notifications_active),
                  ),
                )
              : NotificationOverlay(portalController: portalController)
        ],
      )),
    );
  }
}
