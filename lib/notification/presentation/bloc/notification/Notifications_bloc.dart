import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_design/notification/domain/entities/notification.dart';
import '../../../../../base/error/failures.dart';
import '../../../../../base/strings/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../screen/tabbar/Notification_class.dart';

import '../../../domain/usecases/get_all_notification.dart';
import 'Notifications_event.dart';
import 'Notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetAllNotificationUsecase getAllNotifications;
  NotificationsBloc({
    required this.getAllNotifications,
  }) : super(NotificationsInitial()) {
    on<NotificationsEvent>((event, emit) async {
      if (event is GetAllNotificationsEvent) {
        emit(LoadingNotificationState());

        final failureOrNotifications = await getAllNotifications();
        emit(_mapFailureOrNotificationsToState(failureOrNotifications));


        // ChangeEvent
      } else if (event is RefreshNotificationsEvent) {
        emit(LoadingNotificationState());

        final failureOrNotifications = await getAllNotifications();
        emit(_mapFailureOrNotificationsToState(failureOrNotifications));
      }
      else if (event is GetValueNotificationBarEvent) {
    
        NotificationHome.assignment = 34;
        NotificationHome.notifications = 26;
        emit(GetValueNotificationBarState());
        
      } else if (event is ReadValueNotificationBarEvent) {
        NotificationHome.assignment = 0;
        NotificationHome.notifications = 0;

        emit(ReadValueNotificationBarState());
      }
    });
  }

  NotificationsState _mapFailureOrNotificationsToState(
      Either<Failure, List<NotificationClass>> either) {
    return either.fold(
      (failure) =>
          ErrorNotificationsState(message: _mapFailureToMessage(failure)),
      (notifications) => LoadedNotificationState(
        notification: notifications,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {

    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
