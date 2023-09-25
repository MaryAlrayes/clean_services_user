import 'package:flutter/cupertino.dart';
import 'package:saudi_clean_services/core/utils/enums/notifications_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension NotificationTypeExtension on NotificationType {
  String displayText(BuildContext context) {
    switch (this) {
      case NotificationType.order_accepted:
        return AppLocalizations.of(context)!.order_accepted_noti;
      case NotificationType.order_rejected:
        return AppLocalizations.of(context)!.order_rejected_noti;
      case NotificationType.deliveryman_accept_order:
        return AppLocalizations.of(context)!.delivery_accepted_order_noti;
      case NotificationType.order_in_laundry:
        return AppLocalizations.of(context)!.order_in_laundry_noti;
      case NotificationType.order_done:
        return AppLocalizations.of(context)!.order_done_noti;
      case NotificationType.order_recieved:
        return AppLocalizations.of(context)!.order_recieved_noti;
    }
  }
}
