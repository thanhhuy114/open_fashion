import '../../../../ultis/resources/data_state.dart';
import '../../../collection/data/repositories/base/base_repository.dart';
import '../../domain/repository/blog_post_repositoty.dart';
import '../data_sources/remote/blog_post_api_service.dart';

class BlogPostRepositoryImpl extends BaseRepository
    implements BlogPostRepository {
  BlogPostRepositoryImpl(this._blogPostApiService);
  final BlogPostApiService _blogPostApiService;

  @override
  Future<DataState> getBlogPost() {
    return getOfState(() => _blogPostApiService.getBlogPost());
  }
}
