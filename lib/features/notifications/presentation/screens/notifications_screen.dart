import 'package:flutter/material.dart';

import '../../../../core/managers/values_manager.dart';
import '../../data/notification.dart';
import '../widgets/notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NotificationsScreen extends StatelessWidget {
  static const routeName = 'notifications_screen';
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.notification,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all( AppPadding.p16),
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(
                height: 4,
              ),
              itemBuilder: (context, index) {
                return NotificationItem(notification: notifications[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
