import '../../../../ultis/resources/data_state.dart';

abstract class BlogPostRepository {
  Future<DataState> getBlogPost();
}
