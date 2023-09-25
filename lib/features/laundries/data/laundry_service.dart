// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services/core/utils/enums/enums.dart';
import 'package:saudi_clean_services/features/laundries/data/basic_service.dart';

class LaundryService {
  final String id;
  final String item;
  final ServiceType serviceType;
  final List<BasicService> basicServices;
  LaundryService({
    required this.id,
    required this.item,
    required this.serviceType,
    required this.basicServices,
  });

}
