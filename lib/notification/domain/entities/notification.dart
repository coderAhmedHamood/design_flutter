
import 'package:equatable/equatable.dart';

class NotificationClass extends Equatable {
  int? id;
  final String title;
  final String message;
  final String date;
  final String image;

  NotificationClass({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.image,
  });

  @override
  List<Object?> get props => [id, title, message, date, image];
}