import 'package:equatable/equatable.dart';

class DataStudent extends Equatable {
  final int?   id;
  final String name;
  final String descrption;
  final String image;
  final String className;
  final String    numberOrder;

  DataStudent({
    required this.id,
    required this.name,
    required this.descrption,
    required this.image,
    required this.className,
    required this.numberOrder,
  });

  @override
  List<Object?> get props => [id, name, image, className, numberOrder];
}
