import 'package:bloc/bloc.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../screen/tabbar/Notification_class.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/usecases/get_all_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUsecase getAllPosts;
  PostsBloc({
    required this.getAllPosts,
  }) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPosts();
        emit(_mapFailureOrPostsToState(failureOrPosts));

        // ChangeEvent
      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPosts();
        emit(_mapFailureOrPostsToState(failureOrPosts));

      } else if (event is GetValueNotificationBarEvent) {
        NotificationHome.assignment = 34;
        NotificationHome.notifications = 26;

        print("......set...");
        print(NotificationHome.assignment.toString());
        print(".......set....");
        emit(GetValueNotificationBarState());
      } else if (event is ReadValueNotificationBarEvent) {
        NotificationHome.assignment = 0;
        NotificationHome.notifications = 0;

        print("....read.....");
        print(NotificationHome.assignment.toString());
        print(NotificationHome.assignment.toString());
        print(".......read....");
        emit(ReadValueNotificationBarState());
      }
    });
  }

  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
      (posts) => LoadedPostsState(
        posts: posts,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
