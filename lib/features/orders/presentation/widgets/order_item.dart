

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_manager.dart';
import '../../../../core/managers/styles_manager.dart';
import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/details_btn.dart';
import '../../../../core/utils/extensions/order_status_extension.dart';
import '../../data/order.dart';
import '../screens/order_details_screen.dart';
class OrderItem extends StatelessWidget {
  final Order order;
  const OrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderDetailsScreen.routeName,
          arguments: {'order': order},
        );
      },
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: ListTile(
            title: _buildTitle(context),
            subtitle: _buildStatus(context),
            trailing: _buildDetailsBtn(context),
          ),
        ),
      ),
    );
  }

  InkWell _buildDetailsBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderDetailsScreen.routeName,
          arguments: {'order': order},
        );
      },
      child:const DetailsBtn()
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${AppLocalizations.of(context)!.order} #${order.id}',
          style: getBoldStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
        Text(
          order.laundry.name,
        maxLines: 2,
          style: getMediumStyle(
            color: Colors.black,
            fontSize: FontSize.s16,

          ).copyWith(overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  Row _buildStatus(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.history,
          color: ColorManager.primary,
          size: 18,
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            order.orderStatus.displayText(context),
            style: getMediumStyle(
              color: ColorManager.primary,
              fontSize: FontSize.s16,
            ),
          ),
        )
      ],
    );
  }
}
