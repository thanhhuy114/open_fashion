import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../network/end_points.dart';
import '../../models/blog_post.dart';

part 'blog_post_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl, parser: Parser.JsonSerializable)
abstract class BlogPostApiService {
  factory BlogPostApiService(Dio dio, {String baseUrl}) = _BlogPostApiService;

  @GET(EndPoints.blogPost)
  Future<HttpResponse<BLogPostResponseModel>> getBlogPost();
}
