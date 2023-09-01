import 'package:flutter_design/notification/domain/entities/notification.dart';

import '../repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

class GetAllNotificationUsecase {
  final NotificationsRepository repository;

  GetAllNotificationUsecase(this.repository);

  Future<Either<Failure, List<NotificationClass>>> call() async {
    return await repository.getAllNotifications();
  }
}

