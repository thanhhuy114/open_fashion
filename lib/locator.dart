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
import 'feature/collection/presentation/collection_page/bloc/bloc/remote_collection_bloc.dart';
import 'feature/our_story/data/data_sources/remote/our_story_api_service.dart';
import 'feature/our_story/data/repository/our_story_repository_iml.dart';
import 'feature/our_story/domain/repository/our_story_repository.dart';
import 'feature/our_story/domain/usecases/get_our_story.dart';
import 'feature/our_story/page/our_story_page/bloc/remote/remote_our_story_bloc_bloc.dart';
import 'feature/product_detail/data/data_sources/remote/product_detail_api_service.dart';
import 'feature/product_detail/data/repository/product_detail_repository_iml.dart';
import 'feature/product_detail/domain/repository/product_detail_repository.dart';
import 'feature/product_detail/domain/usecases/get_product_detail.dart';
import 'feature/product_detail/page/product_detail_page/bloc/remote_product_detail_bloc.dart';
import 'feature/product_detail_layout/data/data_source/remote/product_detail_lauyout_api_service.dart';
import 'feature/product_detail_layout/data/repository/product_detail_layout_iml.dart';
import 'feature/product_detail_layout/domain/repository/product_detail_layout_repository.dart';
import 'feature/product_detail_layout/domain/usecases/get_product_detail_layout.dart';
import 'feature/product_detail_layout/page/product_detail_layout_page/bloc/remote_product_detail_layout_bloc.dart';
import 'features/contactus/contact_us_page/bloc/contact_us_bloc.dart';
import 'features/contactus/data/contact_us_repository_impl.dart';
import 'features/contactus/domain/contact_us_repository.dart';
import 'features/contactus/domain/get_contact_us.dart';
import 'features/drawer/data/drawer_repository_impl.dart';
import 'features/drawer/domain/drawer_repository.dart';
import 'features/drawer/domain/get_drawer.dart';
import 'features/footer/data/footer_repository_impl.dart';
import 'features/footer/domain/footer_repository.dart';
import 'features/footer/domain/get_footer.dart';
import 'features/homepage/data/repository/arrival_repository_impl.dart';
import 'features/homepage/domain/repository/arrival_repository.dart';
import 'features/homepage/domain/usecases/get_arrival.dart';
import 'features/homepage/domain/usecases/get_followus.dart';
import 'features/homepage/domain/usecases/get_justforyou.dart';
import 'features/homepage/home_page/bloc/footer_bloc.dart';
import 'network/api.dart';
import 'network/api_provider.dart';
import 'features/homepage/home_page/bloc/drawer_bloc.dart';
import 'features/homepage/home_page/bloc/home_page_arrival_bloc.dart';
import 'features/homepage/home_page/bloc/home_page_followus_bloc.dart';
import 'features/homepage/home_page/bloc/home_page_justforyou_bloc.dart';

final sl = GetIt.instance;

Future initializeDefendencies() async {
  sl.registerSingleton<Dio>(Dio());
  //api
  sl.registerSingleton<CollectionApiService>(CollectionApiService(sl()));

  sl.registerSingleton<CollectionRepository>(CollecctionRepositoryImpl(sl()));

  sl.registerSingleton<BlogPostApiService>(BlogPostApiService(sl()));

  sl.registerSingleton<BlogPostRepository>(BlogPostRepositoryImpl(sl()));
  sl.registerSingleton<OurStoryApiService>(OurStoryApiService(sl()));
  sl.registerSingleton<ProductDetailApiService>(ProductDetailApiService(sl()));
  sl.registerSingleton<ProductDetailLayoutApiService>(
    ProductDetailLayoutApiService(sl()),
  );
  //dependencies
  sl.registerSingleton<OurStoryRepository>(OurStoryRepositoryIml(sl()));
  sl.registerSingleton<ProductDetailRepository>(
    ProductDetailRepositoryIml(sl()),
  );
  sl.registerSingleton<ProductDetailLayoutRepository>(
    ProductDetailLayoutRepositoryIml(sl()),
  );
  //Dependencies thuan
  sl.registerSingleton<ApiProvider>(ApiProvider());

  sl.registerSingleton<Api>(Api());

  sl.registerSingleton<ArrivalRepository>(ArrivalRepositoryImpl(sl()));

  sl.registerSingleton<ContactUsRepository>(ContactUsRepositoryImpl(sl()));

  sl.registerSingleton<DrawerRepository>(DrawerRepositoryImpl(sl()));

  sl.registerSingleton<FooterRepository>(FooterRepositoryImpl(sl()));
  //Usercase
  sl.registerSingleton<GetCollectionUsecase>(GetCollectionUsecase(sl()));
  sl.registerSingleton<GetBlogPostUseCase>(GetBlogPostUseCase(sl()));

  sl.registerSingleton<GetOurStoryUseCase>(GetOurStoryUseCase(sl()));
  sl.registerSingleton<GetProductDetailUseCase>(GetProductDetailUseCase(sl()));
  sl.registerSingleton<GetProductDetailLayoutUsecase>(
    GetProductDetailLayoutUsecase(sl()),
  );
  //Usecases thuan
  sl.registerSingleton<GetArrivalUseCase>(GetArrivalUseCase(sl()));
  sl.registerSingleton<GetJustForYouUseCase>(GetJustForYouUseCase(sl()));
  sl.registerSingleton<GetContactUsUseCase>(GetContactUsUseCase(sl()));
  sl.registerSingleton<GetFollowUsUseCase>(GetFollowUsUseCase(sl()));
  sl.registerSingleton<GetDrawerUseCase>(GetDrawerUseCase(sl()));
  sl.registerSingleton<GetFooterUseCase>(GetFooterUseCase(sl()));
  //Bloc
  sl.registerSingleton<RemoteCollectionBloc>(RemoteCollectionBloc(sl()));
  sl.registerSingleton<BlogPostBloc>(BlogPostBloc(sl()));
  sl.registerSingleton<RemoteOurStoryBloc>(RemoteOurStoryBloc(sl()));
  sl.registerSingleton<RemoteProductDetailBloc>(RemoteProductDetailBloc(sl()));
  sl.registerSingleton<RemoteProductDetailLayoutBloc>(
    RemoteProductDetailLayoutBloc(sl()),
  );
  //Blocs thuan
  sl.registerFactory<HomePageArrivalBloc>(() => HomePageArrivalBloc(sl()));
  sl.registerFactory<HomePageJustforyouBloc>(
    () => HomePageJustforyouBloc(sl()),
  );
  sl.registerFactory<HomePageFollowusBloc>(() => HomePageFollowusBloc(sl()));
  sl.registerFactory<DrawerBloc>(() => DrawerBloc(sl()));
  sl.registerFactory<FooterBloc>(() => FooterBloc(sl()));
  sl.registerFactory<ContactUsBloc>(() => ContactUsBloc(sl()));
}
