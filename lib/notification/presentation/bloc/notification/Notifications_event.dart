import 'package:equatable/equatable.dart';

// part of 'Notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class RefreshNotificationsEvent extends NotificationsEvent {}

class GetAllNotificationsEvent extends NotificationsEvent {}

class GetValueNotificationBarEvent extends NotificationsEvent {}
class GetNotificationToParentEvent extends NotificationsEvent {
  int idStudent;
  GetNotificationToParentEvent({required this.idStudent});
    @override
  List<Object> get props => [idStudent];
}

class ReadValueNotificationBarEvent extends NotificationsEvent {}
class ReadValueStudentFollowNotificationBarEvent extends NotificationsEvent {}

