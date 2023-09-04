
import 'package:equatable/equatable.dart';

class Student extends Equatable{
  final int? id;
  final String name;
Student({
  required this.id,
  required this.name,
});
@override
List<Object?> get props => [id, name];
}


class StudentModel extends Student{
  
  

  StudentModel({
    required int? id,
    required String name,
  }):super(
          id: id,
          name: name,
          
        );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }


}