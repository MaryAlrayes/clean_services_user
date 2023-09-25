
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../laundries/data/basic_service.dart';
import '../../../bloc/bloc/step2_bloc.dart';
import '../../../bloc/cubit/item_cell_cubit.dart';
import '../../../bloc/cubit/services_cell_cubit.dart';
import 'service_check_box_item.dart';

class ServicesCell extends StatelessWidget {
  final int rowIndex;
  const ServicesCell({
    Key? key,
    required this.rowIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesCellCubit, ServicesCellListState>(
      listener: (context, state) {
        BlocProvider.of<Step2Bloc>(context).add(ServicesChangedEvent(
            services: state.basicServicesList, index: rowIndex));
      },
      builder: (context, state) {
        return BlocBuilder<ItemCellCubit, ItemCellState>(
          builder: (context, state) {
            if (state is ItemCellInitial) {
              return Container();
            } else if (state is ItemCellChanged) {
              List<BasicService> basicServices =
                  state.laundryService.basicServices;
              return _buildServiceDropDown(basicServices, context);
            } else {
              return Container();
            }
          },
        );
      },
    );
  }

  Widget _buildServiceDropDown(
      List<BasicService> basicServices, BuildContext context) {
    return BlocBuilder<ServicesCellCubit, ServicesCellListState>(
      builder: (context, state) {
        return DropdownButton<BasicService>(
          hint: state.basicServicesList.isEmpty
              ?  Text(AppLocalizations.of(context)!.choose_services)
              : _buildPickedServices(state),
          items: basicServices.map(
            (e) {
              return _buildMenuItem(e, state, context);
            },
          ).toList(),
          onChanged: (value) {
            if (value != null) {}
          },
        );
      },
    );
  }

  Row _buildPickedServices(ServicesCellListState state) {
    return Row(
      children: state.basicServicesList
          .map(
            (e) => Text(
              '(${e.service} - ${e.price}) ',
            ),
          )
          .toList(),
    );
  }

  DropdownMenuItem<BasicService> _buildMenuItem(
      BasicService e, ServicesCellListState state, BuildContext context) {
    return DropdownMenuItem(
      value: e,
      child: ServiceCheckBoxItem(
        basicService: e,
        isChecked: state.basicServicesList.contains(e),
        onChangedHandler: (value) {
          BlocProvider.of<ServicesCellCubit>(context).serviceChanged(e);
        },
      ),
    );
  }
}
