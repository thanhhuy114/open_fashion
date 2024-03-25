part of 'home_page_justforyou_bloc.dart';

sealed class HomePageJustforyouState extends Equatable {
  const HomePageJustforyouState({this.justforyou,this.error});
  final List<JustForYouEntity> ? justforyou;
  final DioError ? error;
  @override
  List<Object> get props => [justforyou!,error!];
}

class HomePageJFULoading extends HomePageJustforyouState {
  const HomePageJFULoading();
}
class HomePageJFULoaded extends HomePageJustforyouState{
  const HomePageJFULoaded(final List<JustForYouEntity> justforyou):super(justforyou: justforyou);
}
class HomePageJFUError extends HomePageJustforyouState{
  const HomePageJFUError(final DioError error):super(error: error);
}