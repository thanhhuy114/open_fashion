import '../../../../ultis/resources/data_state.dart';
import '../../../../ultis/usecase/usecase.dart';
import '../entities/blog_post_entity.dart';
import '../repository/blog_post_repositoty.dart';

class GetBlogPostUseCase extends UseCase<DataState, void> {
  BlogPostRepository _blogPostRepository;

  GetBlogPostUseCase(this._blogPostRepository);

  @override
  Future<DataState<BlogPostEntity>> call({void params}) {
    return _blogPostRepository.getBlogPost();
  }
}
