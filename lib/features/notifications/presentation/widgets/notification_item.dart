
import 'package:flutter/material.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/utils/enums/notifications_enum.dart';
import '../../data/notification.dart';
import 'basic_notification_item.dart';
import '../../../../core/utils/extensions/notification_extension.dart';
import 'delivery_notification_item.dart';
import 'recieved_notification_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NotificationItem extends StatelessWidget {
  final NotificationData notification;
  const NotificationItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8,
          horizontal: AppPadding.p18,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOrderId(context),
                      const SizedBox(
                        height: 4,
                      ),
                      _buildLanundryName(),
                      const SizedBox(
                        height: 4,
                      ),
                      _getContent(context, notification.notificationType)
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              top: 2,
              child: _buildLaundryDate(context),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildLaundryDate(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.custom_date_time(DateTime.now()),
      style: getRegularStyle(color: Colors.grey),
    );
  }

  Text _buildLanundryName() {
    return Text(
      notification.laundryName,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: getMediumStyle(color: ColorManager.primary),
    );
  }

  Text _buildOrderId(BuildContext context) {
    return Text(
      '${   AppLocalizations.of(context)!.order} ${notification.id}#',
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: getBoldStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }

  Widget _getContent(BuildContext context, NotificationType notificationType) {
    switch (notificationType) {
      case NotificationType.order_accepted:
      case NotificationType.order_rejected:

      case NotificationType.order_in_laundry:
      case NotificationType.order_done:
        return BasicNotificationItem(
          text: notificationType.displayText(context),
        );

      // case NotificationType.order_details:
      //   return ExpansionTile(
      //     backgroundColor: Colors.transparent,
      //     tilePadding:  EdgeInsets.zero,
      //       childrenPadding: EdgeInsets.zero,
      //       title: Text(
      //         'تفاصيل طلبك هي',
      //         style: getRegularStyle(color: Colors.black,),
      //       ),
      //       children: [
      //         Container(
      //           child: Text(
      //             'تفاصيل طلبك هي',
      //           ),
      //         ),
      //       ]);
      case NotificationType.deliveryman_accept_order:
        return DekiveryNotificationItem(
          delegateName: 'جميل جمال',
          text: notificationType.displayText(context),
        );

      case NotificationType.order_recieved:
        return RecievedNotificationItem(
          text: notificationType.displayText(context),
        );
    }
  }
}
