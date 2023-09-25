


import 'package:url_launcher/url_launcher_string.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap({required double latitude,required double longitude}) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
//https://www.google.com/maps/search/?api=1&query=$34.739803,$36.703328
    var uri = Uri.parse("google.navigation:q=$latitude,$longitude&mode=d");
    if (await canLaunchUrlString(uri.toString())) {
      await launchUrlString(uri.toString());
    } else {
      throw 'Could not open the map.';
    }
  }
}
