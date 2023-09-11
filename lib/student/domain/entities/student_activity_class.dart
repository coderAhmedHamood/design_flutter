

import 'package:equatable/equatable.dart';

import 'behaviour_students_class.dart';

class StudentActivityClass extends Equatable {
  int id;
  String name;
  bool isPresent;
  bool isSick;
  String stateHomeWork;
  double degreeMonthTest;
  BehaviourStudentsClass? behaviourStudentsClass;


  StudentActivityClass({
    required this.id,
    required this.name,
    required this.isPresent,
    required this.isSick,
    required this.stateHomeWork,
    required this.degreeMonthTest,
      this.behaviourStudentsClass,
  });
  @override
  List<Object?> get props => [id, name,isPresent,isSick,stateHomeWork,degreeMonthTest,behaviourStudentsClass];
}
