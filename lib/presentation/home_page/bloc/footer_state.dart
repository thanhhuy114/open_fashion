part of 'footer_bloc.dart';

sealed class FooterState extends Equatable {
  const FooterState();

  @override
  List<Object> get props => [];
}

final class FooterLoading extends FooterState {}

class FooterLoaded extends FooterState {
  const FooterLoaded({required this.footer});
  final FooterModel? footer;
}

class FooterError extends FooterState {
  const FooterError({required this.error});
  final String? error;
}
