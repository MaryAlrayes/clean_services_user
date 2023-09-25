// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services/features/ask_service/data/NewOrderDetails.dart';

class NewOrder {
  final String laundry;
  final String city;
  final int buildingNumber;
  final int floorNumber;
  final num lat;
  final num lng;
  final bool isReturnedByDelgate;
  final List<NewOrderDetails> details;
  NewOrder({
    required this.laundry,
    required this.city,
    required this.buildingNumber,
    required this.floorNumber,
    required this.lat,
    required this.lng,
    required this.isReturnedByDelgate,
    required this.details,
  });

  NewOrder copyWith({
    String? laundry,
    String? city,
    int? buildingNumber,
    int? floorNumber,
    num? lat,
    num? lng,
    bool? isReturnedByDelgate,
    List<NewOrderDetails>? details,
  }) {
    return NewOrder(
      laundry: laundry ?? this.laundry,
      city: city ?? this.city,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      floorNumber: floorNumber ?? this.floorNumber,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      isReturnedByDelgate: isReturnedByDelgate ?? this.isReturnedByDelgate,
      details: details ?? this.details,
    );
  }
}
