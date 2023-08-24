import 'package:flutter_design/branch/domain/entities/branch.dart';
import 'package:flutter_design/branch/domain/repositories/branch_repository.dart';
import 'package:flutter_design/branch/presentation/bloc/branch/branch_bloc.dart';
import 'package:flutter_design/notification/domain/usecases/get_all_notification.dart';

import 'base/network/network_info.dart';
 
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
 
import 'branch/data/datasources/branch_local_data_source.dart';
import 'branch/data/datasources/branch_remote_data_source.dart';
import 'branch/data/repositories/branch_repository_impl.dart';
import 'branch/domain/usecases/get_all_branch.dart';
import 'home_main/data/datasources/post_local_data_source.dart';
import 'home_main/data/datasources/post_remote_data_source.dart';
import 'home_main/data/repositories/post_repository_impl.dart';
import 'home_main/domain/repositories/posts_repository.dart';
import 'home_main/domain/usecases/add_post.dart';
import 'home_main/domain/usecases/delete_post.dart';
import 'home_main/domain/usecases/get_all_posts.dart';
import 'home_main/domain/usecases/update_post.dart';
import 'home_main/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'home_main/presentation/bloc/posts/posts_bloc.dart';
import 'notification/data/datasources/notification_local_data_source.dart';
import 'notification/data/datasources/notification_remote_data_source.dart';
import 'notification/data/repositories/notification_repository_impl.dart';
import 'notification/domain/repositories/notification_repository.dart';
import 'notification/presentation/bloc/notification/Notifications_bloc.dart';




final sl = GetIt.instance;

Future<void> init() async {
//! - Home_Page
// Bloc
//! bloc  Post
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), updatePost: sl(), deletePost: sl()));
//! Usecases  Post
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  // sl.registerLazySingleton(() => AddPostUsecase(sl()));
  // sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  // sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
//!  Repository Post
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
//!  Datasources Post
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));
      


//! bloc  Branch
  sl.registerFactory(() => BranchBloc(getAllBranch: sl()));
// Usecases
//!  Usecases Branch
  sl.registerLazySingleton(() => GetAllBranchUsecase(sl()));
//!  Repository Branch
sl.registerLazySingleton<BranchRepository>(() => BranchRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
//!  Datasources Branch
sl.registerLazySingleton<BranchRemoteDataSource>(
      () => BranchRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<BranchLocalDataSource>(
      () => BranchLocalDataSourceImpl(sharedPreferences: sl()));



//! bloc  Notification
  sl.registerFactory(() => NotificationsBloc(getAllNotifications: sl()));
// Usecases
//!  Usecases Notification
  sl.registerLazySingleton(() => GetAllNotificationUsecase(sl()));
//!  Repository Notification
sl.registerLazySingleton<NotificationsRepository>(() => NotificationsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
//!  Datasources Notification
sl.registerLazySingleton<NotificationRemoteDataSource>(
      () => NotificationRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NotificationLocalDataSource>(
      () => NotificationLocalDataSourceImpl(sharedPreferences: sl()));



//! Base
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
