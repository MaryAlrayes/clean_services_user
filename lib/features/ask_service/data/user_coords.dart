// ignore_for_file: public_member_api_docs, sort_constructors_first
class Coords {
  final num lat;
  final num lng;
  Coords({
    required this.lat,
    required this.lng,
  });
}

abstract class UserCoords {
 Future<Coords> getCoords();
}
