
import 'package:flutter/material.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/details_btn.dart';
import '../../data/order_log.dart';
import '../screens/order_log_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrderLogItem extends StatelessWidget {
  final OrderLog orderLog;
  const OrderLogItem({
    Key? key,
    required this.orderLog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderLogDetailsScreen.routeName,
          arguments: {'orderLog': orderLog},
        );
      },
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: ListTile(
            title: _buildTitle(context),
            subtitle: _buildLaundry(context),
            trailing: _buildDetailsBtn(context),
          ),
        ),
      ),
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      '${AppLocalizations.of(context)!.order} #${orderLog.id}',
      style: getBoldStyle(
        color: Colors.black,
        fontSize: FontSize.s16,
      ),
    );
  }

  InkWell _buildDetailsBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderLogDetailsScreen.routeName,
          arguments: {'orderLog': orderLog},
        );
      },
  child:const DetailsBtn()
    );
  }

  Row _buildLaundry(BuildContext context) {
    return Row(
      children: [
        Text(
          orderLog.laundry.name,
          style: getMediumStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s16,
          ),
        )
      ],
    );
  }
}
