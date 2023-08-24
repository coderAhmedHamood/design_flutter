 

 
import '../../domain/entities/branch.dart';

class BranchModel extends Branch {
   BranchModel({
      
   int? id,
  required String title,
  required String location,
  required  int likes,
  required  bool isLikes,
  required String imageUrl,
 
  }) : super(
           id: id,
          title: title,
          location: location,
          likes: likes,
          isLikes: isLikes,
          imageUrl: imageUrl,
        );
 
 factory BranchModel.fromJson(Map<String, dynamic> json) {
    dynamic id = json['id'];
    int parsedId = (id is int) ? id : int.parse(id);
    return BranchModel(
      id: parsedId,
      title: json['title'],
      location: json['location'],
      likes: json['likes'],
      isLikes: json['isLikes'],
      imageUrl: json['imageUrl'],
    );
  }

 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'likes': likes,
      'isLikes': isLikes,
      'imageUrl': imageUrl,
    };
      }
}
