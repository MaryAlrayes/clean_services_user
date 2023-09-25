
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../core/ui/widgets/custom_text_field.dart';
import '../../../bloc/bloc/step2_bloc.dart';
import '../../../bloc/cubit/items_number_cubit.dart';
import '../../../bloc/cubit/services_cell_cubit.dart';

class NumberItems extends StatelessWidget {
  final int rowIndex;
  const NumberItems({
    Key? key,
    required this.rowIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesCellCubit, ServicesCellListState>(
      listener: (context, state) {
        if (state.basicServicesList.isEmpty) {
          BlocProvider.of<ItemsNumberCubit>(context).numberChanged(0);
          BlocProvider.of<Step2Bloc>(context)
              .add(CountChangedEvent(count: 0, index: rowIndex));
        }
      },
      builder: (context, state) {
        return BlocBuilder<ServicesCellCubit, ServicesCellListState>(
          builder: (context, state) {
            if (state.basicServicesList.isEmpty) {
              return Container();
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  hintText: AppLocalizations.of(context)!.enter_number_pieces,
                  textAlign: TextAlign.center,
                  validator: (String? value) {},
                  onChanged: (value) {
                    if (int.tryParse(value) != null) {
                      BlocProvider.of<ItemsNumberCubit>(context)
                          .numberChanged(int.tryParse(value)!);
                      BlocProvider.of<Step2Bloc>(context).add(CountChangedEvent(
                          count: int.tryParse(value)!, index: rowIndex));
                    }
                  },
                  isObscure: false,
                ),
              );
            }
          },
        );
      },
    );
  }
}
