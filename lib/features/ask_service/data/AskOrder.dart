// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services/features/laundries/data/basic_service.dart';

class AskOrder {
  final String item;
  final List<BasicService> services;
  final int count;
  final double price;
  AskOrder(
      {required this.item,
      required this.services,
      required this.count,
      required this.price});

  factory AskOrder.empty() {
    return AskOrder(
      item: '',
      services: [],
      count: 0,
      price: 0,
    );
  }

  AskOrder copyWith({
    String? item,
    List<BasicService>? services,
    int? count,
    double? price,
  }) {
    return AskOrder(
      item: item ?? this.item,
      services: services ?? this.services,
      count: count ?? this.count,
      price: price ?? this.price,
    );
  }
}
