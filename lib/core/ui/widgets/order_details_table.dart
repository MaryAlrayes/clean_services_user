import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../features/orders/data/order_services.dart';
import '../../managers/font_manager.dart';
import '../../managers/styles_manager.dart';
import 'custom_data_table.dart';
import 'custom_label.dart';

class OrderDetailsTable extends StatelessWidget {
  final List<OrderService> services;
  final num price;
  final num commission;
  const OrderDetailsTable({
    Key? key,
    required this.services,
    required this.price,
    required this.commission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 8,
        ),
        CustomDataTable(
          columns: getColums(context),
          rows: getRows(
            services,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        _buildPrice(context),
        const SizedBox(
          height: 8,
        ),
        _buildCommssions(context),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          height: 8,
          thickness: 1,
        ),
        const SizedBox(
          height: 4,
        ),
        _buildTotal(context)
      ],
    );
  }

  List<String> getColums(BuildContext context) {
    List<String> columns = [
      '#',
      AppLocalizations.of(context)!.item_type,
      AppLocalizations.of(context)!.service_type,
      AppLocalizations.of(context)!.counts,
   AppLocalizations.of(context)!.price
    ];
    return columns;
  }

  List<DataRow> getRows(List<OrderService> data) {
    return data.map((e) {
      final cells = [e.serviceId, e.item, e.serviceType, e.count, e.price];
      return DataRow(
        cells: getCells(
          cells,
        ),
      );
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((cell) {
      if (cell is List<String> ) {
        return _buildServiceCell(cell);
      } else {
        return _buildBasicCell(cell);
      }
    }).toList();
  }

  DataCell _buildBasicCell(cell) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Text(
          '$cell',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  DataCell _buildServiceCell(List<String> cell) {
    List<String> newCells = [];
    for (var element in cell) {
      newCells.add(element);
      newCells.add(' - ');
    }
  print('new cells ${newCells.toString()}');
    newCells.removeAt(newCells.length - 1);
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: newCells
              .map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Row(
      children: [
        CustomLabel(
          text: '${AppLocalizations.of(context)!.cost}: ',
        ),
        Text(
          '$price ${AppLocalizations.of(context)!.saudi_currency}',
          style: getRegularStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }

  Widget _buildCommssions(BuildContext context) {
    return Row(
      children: [
        CustomLabel(
          text: '${AppLocalizations.of(context)!.commission}: ',
        ),
        Text(
          '$commission ${AppLocalizations.of(context)!.saudi_currency}',
          style: getRegularStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }

  Widget _buildTotal(BuildContext context) {
    return Row(
      children: [
        CustomLabel(
          text: '${AppLocalizations.of(context)!.total}: ',
        ),
        Text(
          '${price + commission} ${AppLocalizations.of(context)!.saudi_currency}',
          style: getRegularStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(BuildContext context) {
    return CustomLabel(
      text: AppLocalizations.of(context)!.order_details,
    );
  }
}
