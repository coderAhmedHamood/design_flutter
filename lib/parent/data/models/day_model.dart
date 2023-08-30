import '../../domain/entities/student_attendance_day.dart';

class StudentAttendanceDayModel extends StudentAttendanceDay {
  StudentAttendanceDayModel({
    required String day,
    required List<String> subjects,
  }) : super(
          day: day,
          subjects: subjects,
        );

  factory StudentAttendanceDayModel.fromJson(Map<String, dynamic> json) {
    return StudentAttendanceDayModel(
      day: json['day'],
      subjects: List<String>.from(json['subjects']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'subjects': subjects,
    };
  }
}
