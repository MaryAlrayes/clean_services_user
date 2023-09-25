// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'step1_bloc.dart';

enum Step1Validation {
  init,
  cityEmpty,
  buildingNumberEmpty,
  floorNumberEmpty,
  coordsEmpty,
  negativeNumber,
  valid
}

class Step1State extends Equatable {
  final String laundryName;
  final String city;
  final int buildingNumber;
  final int floorNumber;
  final double lat;
  final double lng;
  final Step1Validation validation;

  @override
  List<Object> get props => [
        laundryName,
        city,
        buildingNumber,
        floorNumber,
        lat,
        lng,
        validation,
      ];

  const Step1State({
    required this.laundryName,
    required this.city,
    required this.buildingNumber,
    required this.floorNumber,
    required this.lat,
    required this.lng,
    required this.validation,
  });

  factory Step1State.empty() {
    return const Step1State(
        laundryName: '',
        city: '',
        buildingNumber: -1,
        floorNumber: -1,
        lat: 0,
        lng: 0,
        validation: Step1Validation.init);
  }

  Step1State copyWith({
    String? laundryName,
    String? city,
    int? buildingNumber,
    int? floorNumber,
    double? lat,
    double? lng,
    Step1Validation? validation,
  }) {
    return Step1State(
      laundryName: laundryName ?? this.laundryName,
      city: city ?? this.city,
      buildingNumber: buildingNumber ?? this.buildingNumber,
      floorNumber: floorNumber ?? this.floorNumber,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      validation: validation ?? this.validation,
    );
  }

  @override
  bool get stringify => true;
}
