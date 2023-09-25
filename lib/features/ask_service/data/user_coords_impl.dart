import 'package:saudi_clean_services/core/utils/services/location_service.dart';
import 'package:saudi_clean_services/features/ask_service/data/user_coords.dart';

class UserCoordsLocationImpl implements UserCoords {
  @override
  Future<Coords> getCoords() async {
    Coords coords = await getCurrentLocation();
    
    return coords;
  }
}
