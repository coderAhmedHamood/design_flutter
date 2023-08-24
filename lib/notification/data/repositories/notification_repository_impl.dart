import 'package:dartz/dartz.dart';

import '../../../../base/error/exceptions.dart';
import '../../../../base/error/failures.dart';
import '../../../../base/network/network_info.dart';
import '../../domain/entities/notification.dart';

import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_local_data_source.dart';
import '../datasources/notification_remote_data_source.dart';
import '../models/notification_model.dart';



typedef Future<Unit> GetAddNotification();

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationRemoteDataSource remoteDataSource;
  final NotificationLocalDataSource  localDataSource;
  final NetworkInfo networkInfo;

  NotificationsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, List<NotificationClass>>> getAllNotifications() async {
    if (await networkInfo.isConnected) {
      try {

        final remoteNotifications = await remoteDataSource.getAllNotifications();
        localDataSource.cacheNotifications(remoteNotifications);
        //hare store the data to cash
        return Right(remoteNotifications);
      } on ServerException {
        
        return Left(ServerFailure());
      }
    } else {
      try {
        final localNotifications = await localDataSource.getCachedNotifications();
        return Right(localNotifications);
      } on EmptyCacheException {
        
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addNotification(NotificationClass notification) async {
    final NotificationModel notificationModel = NotificationModel(
    title: notification.title,
    message: notification.message,
    date: notification.date,
    image: notification.image,
    );

    return await _getMessage(() {
      return remoteDataSource.addNotification(notificationModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> readAllNotification(int notificationId) async {
    return await _getMessage(() {
      return remoteDataSource.readAllNotification(notificationId);
    });
  }

 
  Future<Either<Failure, Unit>> _getMessage(
      GetAddNotification getAddNotification) async {
    if (await networkInfo.isConnected) {
      try {
        await getAddNotification();
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
