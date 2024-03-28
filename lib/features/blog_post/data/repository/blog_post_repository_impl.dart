import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../ultis/resources/data_state.dart';
import '../../../collection/data/repositories/base/base_repository.dart';
import '../../domain/repository/blog_post_repositoty.dart';
import '../data_sources/remote/blog_post_api_service.dart';
import '../models/blog_post.dart';

class BlogPostRepositoryImpl extends BaseRepository
    implements BlogPostRepository {
  BlogPostRepositoryImpl(this._blogPostApiService);
  final BlogPostApiService _blogPostApiService;

  @override
  Future<DataState<BlogPostModel>> getBlogPost() async {
    try {
      final httpResponse = await _blogPostApiService.getBlogPost();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(data: httpResponse.data.data);
      } else {
        throw DioException(
          requestOptions: RequestOptions(),
          response: httpResponse.response,
        );
      }
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
