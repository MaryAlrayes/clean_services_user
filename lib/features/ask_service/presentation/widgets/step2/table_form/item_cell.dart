
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../core/managers/styles_manager.dart';
import '../../../../../laundries/data/laundry_service.dart';
import '../../../bloc/bloc/step2_bloc.dart';
import '../../../bloc/cubit/item_cell_cubit.dart';

class ItemCell extends StatelessWidget {
  final int rowIndex;
  final List<LaundryService> services;
  const ItemCell({
    Key? key,
    required this.rowIndex,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCellCubit, ItemCellState>(
      builder: (context, state) {
        if (state is ItemCellInitial) {
          return _buildItemDropDown(context);
        } else if (state is ItemCellChanged) {
          return _buildPickedItem(state);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildItemDropDown(BuildContext context) {
    return DropdownButton<LaundryService>(
      hint:  Text(AppLocalizations.of(context)!.item_type),
      items: services.map((e) => _buildDropMenuItem(context, e)).toList(),
      onChanged: (value) {
        if (value != null) {
          BlocProvider.of<ItemCellCubit>(context).changeItem(value);
          BlocProvider.of<Step2Bloc>(context)
              .add(ItemChangedEvent(item: value.item, index: rowIndex));
        }
      },
    );
  }

  DropdownMenuItem<LaundryService> _buildDropMenuItem(
      BuildContext context, LaundryService e) {
    return DropdownMenuItem(
      value: e,
      child: Text(
        e.item,
        style: getRegularStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPickedItem(ItemCellChanged state) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        state.laundryService.item,
        textAlign: TextAlign.center,
      ),
    );
  }
}
