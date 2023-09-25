import 'package:flutter/material.dart';

import 'package:saudi_clean_services/core/managers/assets_manager.dart';
import 'package:saudi_clean_services/core/managers/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GmailLoginBtn extends StatelessWidget {
  const GmailLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Image.asset(
        AssetsManager.gmail,
        scale: 30,
      ),
      label: Text(
        AppLocalizations.of(context)!.login_by_gmail,
        style: const TextStyle(
          color: Colors.black87,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(AppPadding.p12),
        backgroundColor: Colors.white,
        side: BorderSide(width: 2.0, color: Colors.grey.shade300),
      ),
    );
  }
}
