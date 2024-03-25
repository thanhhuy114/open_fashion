part of 'footer_bloc.dart';

sealed class FooterState extends Equatable {
  const FooterState({this.footer, this.error});
  final FooterEntity? footer;
  final DioError ? error;
  @override
  List<Object> get props => [footer!,error!];
}

final class FooterLoading extends FooterState {}

class FooterLoaded extends FooterState {
  FooterLoaded(FooterEntity footer):super(footer: footer);
}

class FooterError extends FooterState {
  FooterError(DioError error):super(error: error);
}
