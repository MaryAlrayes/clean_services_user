class OrderService {
  final String serviceId;
  final String item;
  final List<String> serviceType;
  final int count;
  final double price;
  OrderService({
    required this.serviceId,
    required this.item,
    required this.serviceType,
    required this.count,
    required this.price,
  });

}
