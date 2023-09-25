import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_card.dart';
import '../../../../core/ui/widgets/custom_label.dart';
import '../../../../core/ui/widgets/order_details_table.dart';
import '../../data/order_log.dart';

class OrderLogDetailsScreen extends StatelessWidget {
  static const routeName = 'order_log_details_screen';
  final OrderLog orderLog;
  const OrderLogDetailsScreen({
    Key? key,
    required this.orderLog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(
        '${AppLocalizations.of(context)!.order_details} ${orderLog.id}#',
      ),
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
                child: Center(
                  child: _buildCard(context),
                ),
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

  Column _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildOrderNumber(context),
        _buildDivider(),
        _buildLaundryName(context),
        _buildDivider(),
        _buildDelegateName(context),
        _buildDivider(),
        _buildCreateDate(context),
        _buildDivider(),
        _buildDeliverDate(context),
        _buildDivider(),
        _buildServicesDetails(),
      ],
    );
  }

  Widget _buildServicesDetails() {
    return OrderDetailsTable(
      services: orderLog.services,
      commission: orderLog.commissions,
      price: orderLog.price,
    );
  }

  Widget _buildLaundryName(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.laundry_name}: ',
      orderLog.laundry.name,
    );
  }

  Widget _buildDelegateName(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.deliveryman_name}: ',
      orderLog.delegateName,
    );
  }

  Widget _buildCreateDate(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.order_date}: ',
      AppLocalizations.of(context)!.custom_date(DateTime.now()),
    );
  }

  Widget _buildDeliverDate(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.delivery_date}: ',
      AppLocalizations.of(context)!.custom_date(DateTime.now()),
    );
  }

  Widget _buildOrderNumber(BuildContext context) {
    return _buildRow(
      '${AppLocalizations.of(context)!.order_id}: ',
      '#${orderLog.id}',
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

  Divider _buildDivider() {
    return const Divider(
      height: 16,
      thickness: 0.5,
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
        fontSize: FontSize.s14,
      ),
    );
  }
}
