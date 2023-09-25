// ignore_for_file: public_member_api_docs, sort_constructors_first
class BasicService {
  final String service;
  final double price;
  BasicService({
    required this.service,
    required this.price,
  });

  @override
  String toString() => 'BasicService(service: $service, price: $price)';
}
