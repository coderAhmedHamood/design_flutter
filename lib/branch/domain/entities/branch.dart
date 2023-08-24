import 'package:equatable/equatable.dart';

class Branch extends Equatable {
  final int? id;
  final String title;
  final String location;
  final int likes;
  final bool isLikes;
  final String imageUrl;

  Branch({
    required this.id,
    required this.title,
    required this.location,
    required this.likes,
    required this.isLikes,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, location, likes, isLikes, imageUrl];
}
