
import 'package:equatable/equatable.dart';

class StudentsClassClass extends Equatable{
  final int? id;
  final name;

  StudentsClassClass({
    required this.id,
    required this.name,
  });
  @override
  List<Object?> get props => [id, name];
}


