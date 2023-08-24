import 'package:dartz/dartz.dart';
import 'package:flutter_design/notification/domain/entities/notification.dart';

import '../../../../base/error/failures.dart';
import '../repositories/notification_repository.dart';

class AddNotificationUsecase {
  final NotificationsRepository repository;

  AddNotificationUsecase(this.repository);

  Future<Either<Failure, Unit>> call(NotificationClass notificationClass) async {
    return await repository.addNotification(notificationClass);
  }
}
