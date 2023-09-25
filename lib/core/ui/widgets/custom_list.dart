// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:saudi_clean_services/core/ui/widgets/custom_animated_list.dart';

class CustomList extends StatelessWidget {
  final List<Widget> items;
  final Tween<Offset> tween;
   final GlobalKey<AnimatedListState> keyList;
  CustomList({
    Key? key,
    required this.items,
    required this.tween,
    required this.keyList,
  }) : super(key: key);


  final List<Widget> _animatedItems = [];
  @override
  Widget build(BuildContext context) {
    _addAnimatedItems(items);
     return SingleChildScrollView(
      child: CustomAnimatedList(
        itemsWidgets: _animatedItems,
        keyList: keyList,
        offset: tween,
      ),
    );
  }
   void _addAnimatedItems(List<Widget> items) {
    Future ft = Future((() {}));
    for (int i = 0; i < items.length; i++) {
      ft = ft.then((_) {
        return Future.delayed(
          const Duration(milliseconds: 150),
          () {
            _animatedItems.add(items[i]);
            if(keyList.currentState!=null) {
              keyList.currentState!.insertItem(_animatedItems.length - 1);
            }
          },
        );
      });
    }
}
}
