// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:saudi_clean_services/core/utils/enums/notifications_enum.dart';

class NotificationData {
  final String id;
  final String orderId;
  final String laundryName;
  final NotificationType notificationType;
  final DateTime date;
  NotificationData({
    required this.id,
    required this.orderId,
    required this.laundryName,
    required this.notificationType,
    required this.date,
  });
}

final notifications = [
  NotificationData(
    id: '1',
    orderId: '123',
    laundryName: 'مغسلة 1',
    notificationType: NotificationType.order_accepted,
    date: DateTime.now(),
  ),
  NotificationData(
    id: '2',
    orderId: '5678',
     laundryName: 'مغسلة 2',
    notificationType: NotificationType.order_rejected,
    date: DateTime.now(),
  ),
  NotificationData(
    id: '3',
    orderId: '868',
    laundryName: 'مغسلة 3',
    notificationType: NotificationType.deliveryman_accept_order,
    date: DateTime.now(),
  ),
  NotificationData(
    id: '4',
    orderId: '424',
     laundryName: 'مغسلة 4',
    notificationType: NotificationType.order_in_laundry,
    date: DateTime.now(),
  ),
  NotificationData(
    id: '6',
    orderId: '3345',
    laundryName: 'مغسلة 6',
    notificationType: NotificationType.order_done,
    date: DateTime.now(),
  ),
  NotificationData(
    id: '7',
    orderId: '3345',
   laundryName: 'مغسلة 7',
    notificationType: NotificationType.order_recieved,
    date: DateTime.now(),
  ),
];
