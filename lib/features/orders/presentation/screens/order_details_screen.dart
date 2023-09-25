

import 'package:flutter/material.dart';

import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_card.dart';
import '../../../../core/ui/widgets/custom_label.dart';
import '../../../../core/ui/widgets/order_details_table.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../../../../core/utils/extensions/order_status_extension.dart';
import '../../data/order.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrderDetailsScreen extends StatelessWidget {
  static const routeName = 'order_details_screen';
  final Order order;
  const OrderDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('${AppLocalizations.of(context)!.order_details} ${order.id}#'),
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Stack(
          children: [
            const Background(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: _buildCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return CustomCard(
      child: _buildDetails(context),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildOrderNumber(context),
        _buildDivider(),
        _buildStatus(context),
        _buildDivider(),
        _buildLaundryName(context),
        _buildDivider(),
        _buildDate(context),
        _buildDivider(),
        _buildOrderType(context),
        _buildDivider(),
        _buildServicesDetails(),
      ],
    );
  }

  Divider _buildDivider() {
    return const Divider(
      height: 16,
      thickness: 0.5,
    );
  }

  Widget _buildServicesDetails() {
    return OrderDetailsTable(
      services: order.services,
      commission: order.commissions,
      price: order.price,
    );
  }

  Widget _buildLaundryName(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.laundry_name}: ',
      order.laundry.name,
    );
  }

  Widget _buildDate(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.order_date}: ',
     AppLocalizations.of(context)!.custom_date(DateTime.now()),
    );
  }

  Widget _buildOrderNumber(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.order_id}: ',
      '#${order.id}',
    );
  }

  Widget _buildStatus(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.order_status}: ',
      order.orderStatus.displayText(context),
    );
  }

  Widget _buildOrderType(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.order_type}: ',
      order.orderType.displayText(context),
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: _buildLabel(
            label,
          ),
        ),
        Expanded(
          flex: 2,
          child: _buildValue(
            value,
          ),
        )
      ],
    );
  }

  Widget _buildLabel(String label) {
    return CustomLabel(
      text: label,
    );
  }

  Widget _buildValue(String value) {
    return Text(
      value,
      style: getRegularStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }
}
