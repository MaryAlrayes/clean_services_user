import 'package:flutter/material.dart';

import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/custom_list.dart';
import '../../../../core/utils/constants/tweens.dart';
import '../../../drawer_navigation/presentation/widgets/custom_drawer.dart';
import '../../data/order_log.dart';
import '../widgets/order_log_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OrdersLogScreen extends StatelessWidget {
  const OrdersLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.log_orders_nav),
      ),
      body: Stack(children: [
        const Background(),
        buildLogList(context),
      ]),
    );
  }

  Container buildLogList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: CustomList(
        items: _addItems(context),
        tween: TweenConstants.verticalTween,
        keyList: GlobalKey<AnimatedListState>(),
      ),
    );
  }

  List<Widget> _addItems(BuildContext context) {
    List<Widget> items = [];
    for (var element in ordersLog) {
      items.add(OrderLogItem(
        orderLog: element,
      ));
    }
    return items;
  }
}
