part of 'step1_bloc.dart';

abstract class Step1Event extends Equatable {
  const Step1Event();

  @override
  List<Object> get props => [];
}

class   LaundryChangedEvent extends Step1Event {
  final String laundry;
  const LaundryChangedEvent({
    required this.laundry,
  });
  @override
  List<Object> get props => [laundry];
}
class CityChangedEvent extends Step1Event {
  final String city;
  const CityChangedEvent({
    required this.city,
  });
  @override
  List<Object> get props => [city];
}

class BuildingNumberChangedEvent extends Step1Event {
  final int buildingNumber;
  const BuildingNumberChangedEvent({
    required this.buildingNumber,
  });
  @override
  List<Object> get props => [buildingNumber];
}


class FloorNumberChangedEvent extends Step1Event {
  final int floorNumber;
  const FloorNumberChangedEvent({
    required this.floorNumber,
  });
  @override
  List<Object> get props => [floorNumber];
}


class CoordsChangedEvent extends Step1Event {
  final double lat;
  final double lng;
  const CoordsChangedEvent({
    required this.lat,
    required this.lng
  });
  @override
  List<Object> get props => [lat,lng];
}

class SumbitStep1Event extends Step1Event{}
