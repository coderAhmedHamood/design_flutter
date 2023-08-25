 


 
 
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
    return StudentModel(id: json['id'] , username: json['username'] ,time:json['time'],studentText:json['studentText'],studentImage: json['studentImage'],likes: json['likes'],islikes: json['islikes']);
    
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username,'time':time,'studentText':studentText,'studentImage': studentImage,'likes':likes,'islikes':islikes};
  }
}
