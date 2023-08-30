import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_design/notification/domain/entities/notification.dart';
import '../../../../../base/error/failures.dart';
import '../../../../../base/strings/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../../screen/tabbar/Notification_class.dart';

import '../../../../account/data/model/stor.dart';
import '../../../../parent/domain/entities/Student.dart';
import '../../../../student/domain/entities/student.dart';
import '../../../../student/domain/entities/students_class_class.dart';
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
      } 
      
      else if (event is RefreshNotificationsEvent) {
        emit(LoadingNotificationState());

        final failureOrNotifications = await getAllNotifications();
        emit(_mapFailureOrNotificationsToState(failureOrNotifications));
      } 
      
      else if (event is GetValueNotificationBarEvent) {
        NotificationHome.assignment = 34;
        NotificationHome.notifications = 26;
        UserData.setUserDataValues(11, "ابو العرب", "12345", "email", "مدير");
        // UserData.setUserDataValues(11, "ابو العرب", "12345", "email", "ولي امر");
        TeacherData teacherData = TeacherData('رياضيات', [
          StudentsClassClass(id: 1, name: 'الخامس'),
          StudentsClassClass(id: 2, name: 'السادس'),
          StudentsClassClass(id: 3, name: 'السابع'),
        ]);
        ParentData parentData = ParentData([
          StudentClass(id: 1, name: 'عبداللة سيف'),
          // StudentClass(id: 2, name: 'سيف بن سيف'),
        ]);
        UserData.setParentData(parentData);
        UserData.setTeacherData(teacherData);
        emit(GetValueNotificationBarState());
      } 
      
      else if (event is ReadValueNotificationBarEvent) {
        NotificationHome.notifications = 0;

        emit(ReadValueNotificationBarState());
      } else if (event is ReadValueStudentFollowNotificationBarEvent) {
        NotificationHome.assignment = 0;
        emit(ReadValueStudentFollowNotificationBarState());
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
