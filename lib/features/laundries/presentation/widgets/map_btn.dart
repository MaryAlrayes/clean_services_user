


import 'package:flutter/material.dart';
import 'package:saudi_clean_services/core/utils/services/map_service.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MapBtn extends StatelessWidget {
  final double lat;
  final double lng;
  const MapBtn({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        MapUtils.openMap(latitude: lat, longitude: lng);
      },
      child: Text(
        AppLocalizations.of(context)!.move_to_map,
      ),
    );
  }
}
