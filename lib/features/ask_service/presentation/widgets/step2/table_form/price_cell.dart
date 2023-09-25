import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/bloc/step2_bloc.dart';
import '../../../bloc/cubit/items_number_cubit.dart';
import '../../../bloc/cubit/services_cell_cubit.dart';


class PriceCell extends StatelessWidget {
  final int rowIndex;
  const PriceCell({
    Key? key,
    required this.rowIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsNumberCubit, ItemsNumberState>(
      listener: (context, state) {},
      child: Builder(
        builder: (context) {
          final servicesState = context.watch<ServicesCellCubit>().state;
          final countState = context.watch<ItemsNumberCubit>().state;

          if (servicesState.basicServicesList.isNotEmpty &&
              countState.number != 0) {
            double price = 0;
            for (var element in servicesState.basicServicesList) {
              price += element.price;
            }
            price *= countState.number;
            BlocProvider.of<Step2Bloc>(context)
                .add(PriceChangedEvent(price: price, index: rowIndex));
            return _buildPrice(price);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Container _buildPrice(double price) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        price.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
