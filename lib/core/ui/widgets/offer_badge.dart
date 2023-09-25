import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../managers/assets_manager.dart';
import '../../managers/font_manager.dart';
import '../../managers/styles_manager.dart';

class OfferBadge extends StatelessWidget {
  const OfferBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        AssetsManager.offer,
        scale: 8,
      ),
      RotationTransition(
        turns: const AlwaysStoppedAnimation(-15 / 360),
        child: Text(
          AppLocalizations.of(context)!.offer,
          style: getBoldStyle(
            color: Colors.black,
            fontSize: FontSize.s12,
          ),
        ),
      ),
    ]);
  }
}
