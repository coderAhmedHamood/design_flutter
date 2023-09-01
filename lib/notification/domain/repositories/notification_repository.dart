import '../entities/notification.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationClass>>> getAllNotifications();
  Future<Either<Failure, Unit>> readAllNotification(int id);
   Future<Either<Failure, Unit>> addNotification(NotificationClass notification);
   Future<Either<Failure, List<NotificationClass>>> getNotificationsToParentData(int idClass);

}
