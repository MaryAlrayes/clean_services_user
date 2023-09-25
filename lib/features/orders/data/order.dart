// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services/core/utils/enums/enums.dart';
import 'package:saudi_clean_services/core/utils/enums/order_status_enum.dart';
import 'package:saudi_clean_services/features/laundries/data/laundry.dart';
import 'package:saudi_clean_services/features/orders/data/order_services.dart';

class Order {
  final String id;
  final DateTime dateTime;
  final OrderStatus orderStatus;
  final Laundry laundry;
  final List<OrderService> services;
  final OrderType orderType ;
  final num commissions=10;
  final num price=135;
  Order({
    required this.id,
    required this.dateTime,
    required this.orderStatus,
    required this.laundry,
    required this.services,
    required this.orderType,
  });
}

List<Order> myOrders = [
  Order(
    id: '123',
    orderStatus: OrderStatus.pre_processing,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
    orderType: OrderType.twoWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '344',
    orderStatus: OrderStatus.processing,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '456',
    orderStatus: OrderStatus.onWay_to_deliver_to_client,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.twoWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '455',
    orderStatus: OrderStatus.pending_acceptance_from_delivery_to_recieve_from_laundry,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '875',
    orderStatus: OrderStatus.ready_to_deliver,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.twoWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '344',
    orderStatus: OrderStatus.processing,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '321',
    orderStatus: OrderStatus.pre_processing,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '111',
    orderStatus: OrderStatus.onWay_to_deliver_to_laundry,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
    orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '111',
    orderStatus: OrderStatus.onWay_to_recieve_from_client,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.twoWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '124',
    orderStatus: OrderStatus.pending_acceptance_delivery,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '324',
    orderStatus: OrderStatus.pending_laundry_acceptance,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '84',
    orderStatus: OrderStatus.pending_laundry_acceptance,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
  Order(
    id: '90',
    orderStatus: OrderStatus.pending_laundry_acceptance,
    dateTime: DateTime.now(),
    laundry: laundryServices[0],
     orderType: OrderType.oneWay,
    services: [
      OrderService(
          serviceId: '1',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '2',
          serviceType: [
            'غسيل',
            'كوي',
          ],
          item: 'بنطلون',
          price: 45,
          count: 3),
      OrderService(
          serviceId: '3',
          serviceType: [
            'كوي',
          ],
          item: 'كنزة',
          price: 20,
          count: 3),
      OrderService(
          serviceId: '4',
          serviceType: [
            'غسيل',
          ],
          item: 'جاكيت',
          price: 20,
          count: 3),
      OrderService(
        serviceId: '5',
        serviceType: [
          'غسيل',
          'كوي',
        ],
        item: 'طقم',
        price: 30,
        count: 3,
      )
    ],
  ),
];
