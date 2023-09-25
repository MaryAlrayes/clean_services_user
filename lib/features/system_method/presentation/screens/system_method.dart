import 'package:flutter/material.dart';
import 'package:saudi_clean_services/features/drawer_navigation/presentation/widgets/custom_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SystemMethod extends StatelessWidget {
  const SystemMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.how_system_works_nav,
        ),
      ),
    );
  }
}
