import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import '../../../../../../core/managers/color_manager.dart';
import '../../../../../../core/managers/font_manager.dart';
import '../../../../../../core/managers/styles_manager.dart';
import '../../../../../../core/ui/widgets/custom_label.dart';
import '../../../../../laundries/data/laundry_service.dart';
import '../../../bloc/bloc/step2_bloc.dart';
import '../../../bloc/cubit/item_cell_cubit.dart';
import '../../../bloc/cubit/items_number_cubit.dart';
import '../../../bloc/cubit/services_cell_cubit.dart';
import 'item_cell.dart';
import 'number_items.dart';
import 'price_cell.dart';
import 'services_cell.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TableForm extends StatefulWidget {
  final List<LaundryService> services;
  const TableForm({super.key, required this.services});

  @override
  State<TableForm> createState() => _TableFormState();
}

class _TableFormState extends State<TableForm> {
  List<Tuple2<DataRow, int>> rows = [];

  int deleteAddIndexGl = 0;
  @override
  void initState() {
    super.initState();
    rows.add(Tuple2(_buildRow(deleteAddIndexGl), deleteAddIndexGl));
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAddLabel(),
          const SizedBox(
            height: 8,
          ),
          _buildDataTable(context),
          _buildAddBtn()
        ],
      ),
    );
  }

  Container _buildAddLabel() {
    return Container(
      alignment: Alignment.center,
      child:  CustomLabel(
        text:  AppLocalizations.of(context)!.fill_in_the_required_services,
      ),
    );
  }

  Widget _buildDataTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          _buildTable(context),
        ],
      ),
    );
  }

  Widget _buildTable(BuildContext context) {
    return DataTable(
      border: TableBorder.all(
        width: 1.0,
        color: ColorManager.primary,
      ),
      headingRowColor: MaterialStateColor.resolveWith(
        (states) {
          return ColorManager.primary;
        },
      ),
      headingTextStyle: getRegularStyle(color: Colors.white),
      columnSpacing: 30,
      dataRowHeight: 60,
      columns: getColums(),
      rows: getRows(context),
    );
  }

  List<DataColumn> getColums() {
    List<String> columns = [
      '',
     AppLocalizations.of(context)!.service_type,
      AppLocalizations.of(context)!.services,
      AppLocalizations.of(context)!.counts,
      AppLocalizations.of(context)!.cost
    ];
    return columns
        .map(
          (e) => DataColumn(
            label: Expanded(
              child: Text(
                e,
                textAlign: TextAlign.center,
                style: getBoldStyle(
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        )
        .toList();
  }



  List<DataRow> getRows(BuildContext context) {
    List<DataRow> dataRows = [];
    for (var element in rows) {
      dataRows.add(element.item1);
    }
    return dataRows;
  }

  DataRow _buildRow(
    int deleteAddIndex,
  ) {
    ItemCellCubit itemCellCubit = ItemCellCubit();
    ServicesCellCubit servicesCellCubit = ServicesCellCubit();
    ItemsNumberCubit itemsNumberCubit = ItemsNumberCubit();

    return DataRow(
      key: UniqueKey(),
      cells: [
        _buildDeleteCell(deleteAddIndex),
        _buildItemCell(
            itemCellCubit, servicesCellCubit, itemsNumberCubit, deleteAddIndex),
        _buildServicesCell(
            itemCellCubit, servicesCellCubit, itemsNumberCubit, deleteAddIndex),
        _buildCountCell(
            itemCellCubit, servicesCellCubit, itemsNumberCubit, deleteAddIndex),
        _buildPriceCell(
            itemCellCubit, servicesCellCubit, itemsNumberCubit, deleteAddIndex)
      ],
    );
  }

  DataCell _buildItemCell(
      ItemCellCubit itemCellCubit,
      ServicesCellCubit servicesCellCubit,
      ItemsNumberCubit itemsNumberCubit,
      int deleteAddIndex) {
    return DataCell(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => itemCellCubit,
        ),
        BlocProvider(
          create: (context) => servicesCellCubit,
        ),
        BlocProvider(
          create: (context) => itemsNumberCubit,
        ),
      ],
      child: ItemCell(services: widget.services, rowIndex: deleteAddIndex),
    ));
  }

  DataCell _buildServicesCell(
      ItemCellCubit itemCellCubit,
      ServicesCellCubit servicesCellCubit,
      ItemsNumberCubit itemsNumberCubit,
      int deleteAddIndex) {
    return DataCell(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => itemCellCubit,
        ),
        BlocProvider(
          create: (context) => servicesCellCubit,
        ),
        BlocProvider(
          create: (context) => itemsNumberCubit,
        ),
      ],
      child: ServicesCell(rowIndex: deleteAddIndex),
    ));
  }

  DataCell _buildCountCell(
      ItemCellCubit itemCellCubit,
      ServicesCellCubit servicesCellCubit,
      ItemsNumberCubit itemsNumberCubit,
      int deleteAddIndex) {
    return DataCell(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => itemCellCubit,
        ),
        BlocProvider(
          create: (context) => servicesCellCubit,
        ),
        BlocProvider(
          create: (context) => itemsNumberCubit,
        ),
      ],
      child: NumberItems(rowIndex: deleteAddIndex),
    ));
  }

  DataCell _buildPriceCell(
      ItemCellCubit itemCellCubit,
      ServicesCellCubit servicesCellCubit,
      ItemsNumberCubit itemsNumberCubit,
      int deleteAddIndex) {
    return DataCell(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => itemCellCubit,
        ),
        BlocProvider(
          create: (context) => servicesCellCubit,
        ),
        BlocProvider(
          create: (context) => itemsNumberCubit,
        ),
      ],
      child: PriceCell(rowIndex: deleteAddIndex),
    ));
  }

  DataCell _buildDeleteCell(int deleteAddIndex) {
    return DataCell(
      Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  rows.removeWhere(
                      (element) => element.item2 == deleteAddIndex);
                  BlocProvider.of<Step2Bloc>(context)
                      .add(RemoveRowEvent(index: deleteAddIndex));
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton _buildAddBtn() {
    return TextButton.icon(
      onPressed: () {
        setState(() {
          deleteAddIndexGl++;
          rows.add(Tuple2(_buildRow(deleteAddIndexGl), deleteAddIndexGl));
          BlocProvider.of<Step2Bloc>(context).add(AddNewRowEvent());
        });
      },
      icon: const Icon(Icons.add),
      label: Text(
        AppLocalizations.of(context)!.ask_for_another_service,
        style: getBoldStyle(
          color: ColorManager.primary,
          fontSize: FontSize.s16,
        ).copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
      style: TextButton.styleFrom(
        foregroundColor: ColorManager.primary,
      ),
    );
  }
}
