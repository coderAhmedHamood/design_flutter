
import '../../domain/entities/data_student.dart';

class DataStudentModel extends DataStudent {
  DataStudentModel({
    required int? id,
    required String name,
    required String descrption,
    required String image,
    required String className,
    required  String numberOrder,
  }) : super(
          id:id,
          name:name,
          descrption:descrption,
          image:image,
          className:className,
          numberOrder:numberOrder,
        );

  factory DataStudentModel.fromJson(Map<String, dynamic> json) {
    return DataStudentModel(
      id: json['id'],
      name: json['name'],
      descrption: json['descrption'],
      image: json['image'],
      className: json['className'],
      numberOrder: json['numberOrder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name':name,
      'descrption':descrption,
      'image':image,
      'className':className,
      'numberOrder':numberOrder,
      
    };
  }
}
