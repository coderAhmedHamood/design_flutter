class BehaviourStudentsClass {
  String title;
  String message;

  BehaviourStudentsClass({
    required this.title,
    required this.message,
  });

  factory BehaviourStudentsClass.fromJson(Map<String, dynamic> json) {
    return BehaviourStudentsClass(
      title: json['title'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
    };
  }
}