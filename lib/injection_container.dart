import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<ApiProvider>(ApiProvider());

  sl.registerSingleton<Api>(Api());

  sl.registerSingleton<ArrivalRepository>(ArrivalRepositoryImpl(sl()));

  sl.registerSingleton<ContactUsRepository>(ContactUsRepositoryImpl(sl()));

  sl.registerSingleton<DrawerRepository>(DrawerRepositoryImpl(sl()));
  
  sl.registerSingleton<FooterRepository>(FooterRepositoryImpl(sl()));

  //Usecases
  sl.registerSingleton<GetArrivalUseCase>(GetArrivalUseCase(sl()));
  sl.registerSingleton<GetJustForYouUseCase>(GetJustForYouUseCase(sl()));
  sl.registerSingleton<GetContactUsUseCase>(GetContactUsUseCase(sl()));
  sl.registerSingleton<GetFollowUsUseCase>(GetFollowUsUseCase(sl()));
  sl.registerSingleton<GetDrawerUseCase>(GetDrawerUseCase(sl()));
  sl.registerSingleton<GetFooterUseCase>(GetFooterUseCase(sl()));

  //Blocs
  sl.registerFactory<HomePageArrivalBloc>(() => HomePageArrivalBloc(sl()));
  sl.registerFactory<HomePageJustforyouBloc>(() => HomePageJustforyouBloc(sl()));
  sl.registerFactory<HomePageFollowusBloc>(() => HomePageFollowusBloc(sl()));
  sl.registerFactory<DrawerBloc>(() => DrawerBloc(sl()));
  sl.registerFactory<FooterBloc>(() => FooterBloc(sl()));
  sl.registerFactory<ContactUsBloc>(() => ContactUsBloc(sl()));
}