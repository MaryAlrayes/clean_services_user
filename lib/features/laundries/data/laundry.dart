// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services/core/utils/enums/enums.dart';
import 'package:saudi_clean_services/features/laundries/data/basic_service.dart';
import 'package:saudi_clean_services/features/laundries/data/laundry_service.dart';

class Laundry {
  final String id;
  final String name;
  final double rate;
  final String location;
  final String phone='5627239478';
    final double lat=34.739803;
  final double lng= 36.703328;
  final List<LaundryService> services;
  final bool hasOffer;
  Laundry({
    required this.id,
    required this.name,
    required this.rate,
    required this.location,
    required this.services,
    required this.hasOffer,
  });
}

final laundryServices = [
  Laundry(
      id: '1',
      name: 'مغسلة 1',
      rate: 2.4,
          location: 'الرياض',
      hasOffer: true,
      services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '2',
      name: 'مغسلة 1',
      rate: 2.4,
           location: 'الرياض',
      hasOffer: true,
      services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '3',
      name: 'مغسلة 2',
      rate: 2.4,
            location: 'الرياض',
   hasOffer: true,
      services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '4',
      name: 'مغسلة 4',
      rate: 2.4,
         location: 'الرياض',
      hasOffer: false,
      services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '5',
      name: 'مغسلة 5',
      rate: 2.4,
          location: 'الرياض',
      hasOffer: true,
      services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '6',
      name: 'مغسلة 6',
      rate: 2.4,
           location: 'الرياض',
      hasOffer: false,
      services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '7',
      name: 'مغسلة 7',
      rate: 2.4,
         location: 'الرياض',
      hasOffer: true,
     services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '8',
      name: 'مغسلة 8',
      rate: 2.4,
           location: 'الرياض',
      hasOffer: false,
    services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '9',
      name: 'مغسلة 9',
      rate: 2.4,
      location: 'الرياض',
      hasOffer: true,
    services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
  Laundry(
      id: '10',
      name: 'مغسلة 10',
      rate: 2.4,
      location: 'الرياض',
      hasOffer: false,
     services: [
        LaundryService(
          id: '1',
          item: 'كنزة',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '2',
          item: 'بنطلون',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '3',
          item: 'جاكيت',
          basicServices: [
            BasicService(service: 'غسيل', price: 20),
            BasicService(service: 'كوي', price: 20)
          ],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '4',
          item: 'بنطلون',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.light
        ),
        LaundryService(
          id: '5',
          item: 'سجاد',
          basicServices: [BasicService(service: 'غسيل', price: 20)],
          serviceType: ServiceType.heavy
        ),
      ]),
];
