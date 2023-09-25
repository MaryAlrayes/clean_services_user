import 'package:flutter/cupertino.dart';
import 'package:saudi_clean_services/core/utils/enums/enums.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension LaundryFilterExtension on LaundryFilter {
  String displayText(BuildContext context) {
    switch (this) {
      case LaundryFilter.closer:
        return AppLocalizations.of(context)!.closest;
      case LaundryFilter.topRated:
        return AppLocalizations.of(context)!.most_rated;
    }
  }
}

extension ServiceTypeExtension on ServiceType {
  String displayText(BuildContext context) {
    switch (this) {
      case ServiceType.heavy:
        return AppLocalizations.of(context)!.heavy_item_weight;
      case ServiceType.light:
        return AppLocalizations.of(context)!.light_item_weight;
    }
  }
}

extension OrderTypeExtension on OrderType {
  String displayText(BuildContext context) {
    switch (this) {
      case OrderType.oneWay:
        return AppLocalizations.of(context)!.one_way;
      case OrderType.twoWay:
        return AppLocalizations.of(context)!.two_way;
    }
  }
}

extension PayTypesExtension on PayTypes {
  String displayText(BuildContext context) {
    switch (this) {
      case PayTypes.cash:
        return AppLocalizations.of(context)!.pay_cash;
      case PayTypes.masterCard:
        return AppLocalizations.of(context)!.master_card;
      case PayTypes.visaCard:
        return AppLocalizations.of(context)!.visa_card;
      case PayTypes.paypal:
        return AppLocalizations.of(context)!.paypal;
      case PayTypes.googlePay:
        return AppLocalizations.of(context)!.google_pay;
    }
  }
}
