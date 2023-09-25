
import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/utils/enums/order_status_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension OrderStatusExtension on OrderStatus {
  String displayText(BuildContext context) {
    switch (this) {
 case OrderStatus.pending_laundry_acceptance:
        return AppLocalizations.of(context)!.pending_laundry_acceptance;
      case OrderStatus.pending_acceptance_delivery:
        return AppLocalizations.of(context)!.pending_acceptance_delivery;
      case OrderStatus.onWay_to_recieve_from_client:
        return AppLocalizations.of(context)!.onWay_to_recieve_from_client;
      case OrderStatus.onWay_to_deliver_to_laundry:
        return AppLocalizations.of(context)!.onWay_to_deliver_to_laundry;
      case OrderStatus.pre_processing:
        return AppLocalizations.of(context)!.pre_processing;
      case OrderStatus.processing:
        return AppLocalizations.of(context)!.processing;
      case OrderStatus.ready_to_deliver:
        return AppLocalizations.of(context)!.ready_to_deliver;
      case OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry:
        return AppLocalizations.of(context)!
            .pending_acceptance_from_delivery_to_recieve_from_laundry;
      case OrderStatus.onWay_to_recieve_from_laundry:
        return AppLocalizations.of(context)!.onWay_to_recieve_from_laundry;
      case OrderStatus.onWay_to_deliver_to_client:
        return AppLocalizations.of(context)!.onWay_to_deliver_to_client;
      case OrderStatus.recieved:
        return AppLocalizations.of(context)!.recieved;
    }
  }
}
