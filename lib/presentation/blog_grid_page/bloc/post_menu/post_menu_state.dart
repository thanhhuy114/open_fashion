import '../../../../models/post_menu_response_model.dart';

abstract class PostMenuState {}

class PostMenuStateInitial extends PostMenuState {}

class PostMenuStateLoading extends PostMenuState {}

class PostMenuStateSussess extends PostMenuState {
  PostMenuStateSussess({required this.tags, required this.postMenuResponse});

  final PostMenuResponseModel postMenuResponse;
  final List<String> tags;
}

class PostMenuStateFailure extends PostMenuState {}
