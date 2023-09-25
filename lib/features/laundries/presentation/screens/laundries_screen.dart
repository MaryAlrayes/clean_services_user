import 'package:flutter/material.dart';

import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/laundries/laundries_list.dart';
import '../../data/laundry.dart';
import '../widgets/custom_appbar.dart';

class LaundriesScreen extends StatelessWidget {
  const LaundriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Stack(children: [
          const Background(),
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: LaundriesList(
              data: laundryServices,
            ),
          ),
        ]),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 160,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: CustomAppbar(handlerDrawer: () {
        Scaffold.of(context).openDrawer();
      }),
    );
  }
}
