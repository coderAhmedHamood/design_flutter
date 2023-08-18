// Posts

class Post {
  final String? imageUrl;
  final User? author;
  final String? title;
  final String? location;
  final int? likes;
  final int? comments;

  Post({
    this.imageUrl,
    this.author,
    this.title,
    this.location,
    this.likes,
    this.comments,
  });
}

class User {
  final String? profileImageUrl;
  final String? backgroundImageUrl;
  final String? name;
  final int? following;
  final int? followers;
  final List<Post>? posts;
  final List<Post>? favorites;

  User({
    this.profileImageUrl,
    this.backgroundImageUrl,
    this.name,
    this.following,
    this.followers,
    this.posts,
    this.favorites,
  });
}

final _post0 = Post(
  imageUrl: 'assets/school.jpg',
  author: User(),
  title: 'Post 0',
  location: 'Location 0',
  likes: 102,
  comments: 37,
);
final _post1 = Post(
  imageUrl: 'assets/school.jpg',
  author: User(),
  title: 'Post 1',
  location: 'Location 1',
  likes: 532,
  comments: 129,
);
final _post2 = Post(
  imageUrl: 'assets/school.jpg',
  author: User(),
  title: 'Post 2',
  location: 'Location 2',
  likes: 985,
  comments: 213,
);
final _post3 = Post(
  imageUrl: 'assets/school.jpg',
  author: User(),
  title: 'Post 3',
  location: 'Location 3',
  likes: 402,
  comments: 25,
);
final _post4 = Post(
  imageUrl: 'assets/school.jpg',
  author: User(),
  title: 'Post 4',
  location: 'Location 4',
  likes: 628,
  comments: 74,
);
final _post5 = Post(
  imageUrl: 'assets/school.jpg',
  author: User(),
  title: 'Post 5',
  location: 'Location 5',
  likes: 299,
  comments: 28,
);

final posts = [_post0, _post1, _post2, _post3, _post4, _post5];
final users = [
  User(profileImageUrl: 'assets/images/user0.jpg'),
  User(profileImageUrl: 'assets/images/user1.jpg'),
  User(profileImageUrl: 'assets/images/user2.jpg'),
  User(profileImageUrl: 'assets/images/user3.jpg'),
  User(profileImageUrl: 'assets/images/user4.jpg'),
  User(profileImageUrl: 'assets/images/user5.jpg'),
  User(profileImageUrl: 'assets/images/user6.jpg'),
];

// Current User
final User currentUser = User(
  profileImageUrl: 'assets/images/user.jpg',
  backgroundImageUrl: 'assets/images/user_background.jpg',
  name: 'Islam',
  following: 453,
  followers: 937,
);