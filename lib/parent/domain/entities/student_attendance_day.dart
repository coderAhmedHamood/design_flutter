import 'package:equatable/equatable.dart';

class StudentAttendanceDay extends Equatable {
  final String day;
  final List<String> subjects;

  StudentAttendanceDay({required this.day, required this.subjects});
  @override
  List<Object?> get props => [day, subjects];
}