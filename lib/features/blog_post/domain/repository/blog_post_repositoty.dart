import '../../../../ultis/resources/data_state.dart';
import '../entities/blog_post_entity.dart';

abstract class BlogPostRepository {
  Future<DataState<BlogPostEntity>> getBlogPost();
}
