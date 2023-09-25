import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/managers/values_manager.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/laundries/laundries_list.dart';
import '../../../drawer_navigation/presentation/widgets/custom_drawer.dart';
import '../../../laundries/data/laundry.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.favorites_nav,
        ),
      ),
      body: Stack(children: [
        Background(),
        Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              Expanded(
                child: LaundriesList(data: laundryServices),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
