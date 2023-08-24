 import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../repositories/notification_repository.dart';

class ReadAllNotificationUsecase {
  final NotificationsRepository repository;

  ReadAllNotificationUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int notificationId) async {
    return await repository.readAllNotification(notificationId);
  }
}
