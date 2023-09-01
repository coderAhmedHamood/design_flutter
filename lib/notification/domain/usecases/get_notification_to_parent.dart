 
 import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../entities/notification.dart';
import '../repositories/notification_repository.dart';
 
class GetNotificationToParentUsecase {
final NotificationsRepository repository;
  GetNotificationToParentUsecase(this.repository);
  Future<Either<Failure, List<NotificationClass>>> call(int idStudent) async {
    return await repository.getNotificationsToParentData(idStudent);
  }
}

  

 