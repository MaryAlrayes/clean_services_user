import 'package:flutter/material.dart';

import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_list.dart';
import '../../../../core/utils/constants/tweens.dart';
import '../../../drawer_navigation/presentation/widgets/custom_drawer.dart';
import '../../data/order.dart';
import '../widgets/order_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.my_orders_nav),
      ),
      body: SafeArea(
        child: Stack(children: [
          const Background(),
          _buildOrderList(context),
        ]),
      ),
    );
  }

  Container _buildOrderList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: CustomList(
        items: _addItems(context),
        tween: TweenConstants.verticalTween,
        keyList:  GlobalKey<AnimatedListState>(),
      ),
    );
  }

  List<Widget> _addItems(BuildContext context) {
    List<Widget> items = [];
    for (var element in myOrders) {
      items.add(OrderItem(
        order: element,
      ));
    }
    return items;
  }
}
