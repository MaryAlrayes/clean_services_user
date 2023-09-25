import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saudi_clean_services/core/managers/assets_manager.dart';
import 'package:saudi_clean_services/core/managers/font_manager.dart';
import 'package:saudi_clean_services/core/managers/styles_manager.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showSentDialog(
  BuildContext context,
) {
  return Dialog(
    child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Lottie.asset(
            AssetsManager.done,
            width: 150,
            height: 150,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
             AppLocalizations.of(context)!.operation_done_successfully,
            style: getRegularStyle(
              color: Colors.black,
              fontSize: FontSize.s16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
               AppLocalizations.of(context)!.cancel,
            ),
          ),
        ])),
  );
}
