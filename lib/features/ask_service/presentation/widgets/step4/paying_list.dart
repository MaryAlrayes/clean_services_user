import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saudi_clean_services/core/managers/assets_manager.dart';
import 'package:saudi_clean_services/core/utils/enums/enums.dart';
import 'package:saudi_clean_services/features/ask_service/presentation/bloc/bloc/step4_bloc.dart';
import 'package:saudi_clean_services/core/utils/extensions/extensions.dart';

class PayingList extends StatelessWidget {
  PayingList({super.key});
  Map<PayTypes, String> info = {
    PayTypes.cash: AssetsManager.pay_cash,
    PayTypes.visaCard: AssetsManager.visa_card,
    PayTypes.masterCard: AssetsManager.master_card,
    PayTypes.paypal: AssetsManager.paypal,
    PayTypes.googlePay: AssetsManager.google_pay
  };
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Step4Bloc, Step4State>(
      builder: (context, state) {
        return Column(
          children: PayTypes.values
              .map(
                (e) => _buildItem(context, e, info[e]!, state),
              )
              .toList(),
        );
      },
    );
  }

  Card _buildItem(
    BuildContext context,
    PayTypes payType,
    String image,
    Step4State state,
  ) {
    return Card(
      elevation: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: RadioListTile<PayTypes>(
          controlAffinity: ListTileControlAffinity.trailing,
          value: payType,
          groupValue: state.payTypes,
          onChanged: (value) {
            BlocProvider.of<Step4Bloc>(context)
                .add(PayMthodChanged(payTypes: value!));
          },
          title: Row(
            children: <Widget>[
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(image, scale: 0.2),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(payType.displayText(context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
