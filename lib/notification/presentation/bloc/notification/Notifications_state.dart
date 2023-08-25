import 'package:equatable/equatable.dart';

import '../../../domain/entities/notification.dart';
// part of 'Notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class GetValueNotificationBarState extends NotificationsState {}

class ReadValueNotificationBarState extends NotificationsState {}
class ReadValueStudentFollowNotificationBarState extends NotificationsState {}

class LoadingNotificationState extends NotificationsState {}

class LoadedNotificationState extends NotificationsState {
  final List<NotificationClass> notification;
  
  LoadedNotificationState({required this.notification});
  @override
  List<Object> get props => [notification];

}

class ErrorNotificationsState extends NotificationsState {
  final String message;
  ErrorNotificationsState({required this.message});
  @override
  List<Object> get props => [message];
}
