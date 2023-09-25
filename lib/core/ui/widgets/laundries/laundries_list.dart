
import 'package:flutter/material.dart';

import '../../../../features/laundries/data/laundry.dart';
import '../../../utils/constants/tweens.dart';
import '../custom_list.dart';
import 'laundry_item.dart';

class LaundriesList extends StatelessWidget {
  final List<Laundry> data;
  const LaundriesList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _addItems(context);
    return CustomList(
      items: _addItems(context),
      tween: TweenConstants.horizontalTween,
      keyList: GlobalKey<AnimatedListState>(),
    );
  }

  List<Widget> _addItems(BuildContext context) {
    List<Widget> items = [];
    for (var element in data) {
      items.add(LaundryItem(laundry: element));
    }
    return items;
  }
}
