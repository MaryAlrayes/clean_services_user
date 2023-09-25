// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services/features/laundries/data/laundry.dart';
import 'package:saudi_clean_services/features/orders/data/order_services.dart';

class OrderLog {
  final String id;
  final DateTime createDateTime;
  DateTime deliverDateTime = DateTime.now();
  final Laundry laundry;
  String delegateName = 'اسم المندوب';
  final List<OrderService> services;
    final num commissions=10;
  final num price=135;
  OrderLog({
    required this.id,
    required this.createDateTime,
    required this.laundry,
    required this.services,
  });
}

List<OrderLog> ordersLog = [
  OrderLog(
    id: '123',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '344',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '32',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '456',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '455',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '875',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '344',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '321',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '111',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '111',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '124',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '324',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '84',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
  OrderLog(
    id: '90',
    createDateTime: DateTime.now(),
    laundry: laundryServices[0],
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
