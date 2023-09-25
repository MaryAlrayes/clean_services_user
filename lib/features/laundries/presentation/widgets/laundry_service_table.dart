import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/ui/widgets/custom_data_table.dart';
import 'package:saudi_clean_services/features/laundries/data/basic_service.dart';
import 'package:saudi_clean_services/features/laundries/data/laundry_service.dart';
import 'package:saudi_clean_services/core/utils/extensions/extensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LaundryServicesTable extends StatelessWidget {
  final List<LaundryService> data;
  const LaundryServicesTable({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: getColums(context),
      rows: getRows(
        context,
        data,
      ),
    );
  }

  List<String> getColums(BuildContext context) {
    List<String> columns = [
      '#',
       AppLocalizations.of(context)!.item_type,
       AppLocalizations.of(context)!.services_provided_with_it,
       AppLocalizations.of(context)!.item_weight
    ];
    return columns;
  }

  List<DataRow> getRows(BuildContext context, List<LaundryService> data) {
    return data.map((e) {
      final cells = [
        e.id,
        e.item,
        e.basicServices,
        e.serviceType.displayText(context)
      ];
      return DataRow(
        cells: getCells(
          cells,
        ),
      );
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((cell) {
      if (cell is List<BasicService>) {
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

  DataCell _buildServiceCell(List<BasicService> cell) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: cell
              .map(
                (e) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        e.service,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        '${e.price}',
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
