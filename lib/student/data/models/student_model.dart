import '../../domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    int? id,
    required String username,
    required String time,
    required String studentText,
    required String studentImage,
    required int likes,
    required bool islikes,
  }) : super(
          id: id,
          username: username,
          time: time,
          studentText: studentText,
          studentImage: studentImage,
          likes: likes,
          islikes: islikes,
        );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    dynamic id = json['id'];
    int parsedId = (id is int) ? id : int.parse(id);
    return StudentModel(
        id: json['id'],
        username: json['username'],
        time: json['time'],
        studentText: json['studentText'],
        studentImage: json['studentImage'],
        likes: json['likes'],
        islikes: json['islikes']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'time': time,
      'studentText': studentText,
      'studentImage': studentImage,
      'likes': likes,
      'islikes': islikes
    };
  }
}

class StudentAttendanceModel extends StudentsAttendanceClass {
  StudentAttendanceModel(
      {int? id,
      required String name,
      required bool isPresent,
      required bool isSick})
      : super(
          id: id,
          name: name,
          isPresent: isPresent,
          isSick: isSick,
        );

  factory StudentAttendanceModel.fromJson(Map<String, dynamic> json) {
    return StudentAttendanceModel(
        id: json['id'],
        name: json['name'],
        isPresent: json['isPresent'],
        isSick: json['isSick']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isPresent': isPresent,
      'isSick': isSick,
    };
  }
}

class StudentClassModel extends StudentsClassClass {
  StudentClassModel({
    int? id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory StudentClassModel.fromJson(Map<String, dynamic> json) {
    return StudentClassModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
