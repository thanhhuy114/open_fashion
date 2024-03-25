import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'feature/blog_post/data/data_sources/remote/blog_post_api_service.dart';
import 'feature/blog_post/data/repository/blog_post_repository_impl.dart';
import 'feature/blog_post/domain/repository/blog_post_repositoty.dart';
import 'feature/blog_post/domain/usecases/get_blog_post_usecase.dart';
import 'feature/blog_post/pages/blog_post_page/bloc/bloc/blog_post_bloc.dart';
import 'feature/collection/data/datasources/remote/collection_api_service.dart';
import 'feature/collection/data/repositories/collection_repository_impl.dart';
import 'feature/collection/domain/repositories/collection_repository.dart';
import 'feature/collection/domain/usecases/get_collection.dart';
import 'presentation/collection_page/bloc/bloc/remote_collection_bloc.dart';

final sl = GetIt.instance;

Future initializeDefendencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<CollectionApiService>(CollectionApiService(sl()));

  sl.registerSingleton<CollectionRepository>(CollecctionRepositoryImpl(sl()));

  sl.registerSingleton<BlogPostApiService>(BlogPostApiService(sl()));

  sl.registerSingleton<BlogPostRepository>(BlogPostRepositoryImpl(sl()));

  //Usercase
  sl.registerSingleton<GetCollectionUsecase>(GetCollectionUsecase(sl()));
  sl.registerSingleton<GetBlogPostUseCase>(GetBlogPostUseCase(sl()));
  //Bloc
  sl.registerSingleton<RemoteCollectionBloc>(RemoteCollectionBloc(sl()));
  sl.registerSingleton<BlogPostBloc>(BlogPostBloc(sl()));
}
