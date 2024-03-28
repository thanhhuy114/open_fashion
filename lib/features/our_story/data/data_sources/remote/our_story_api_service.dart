import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:retrofit/retrofit.dart';
import '../../../../../network/end_points.dart';
import '../../models/our_story_response_model.dart';
part 'our_story_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl, parser: Parser.JsonSerializable)
abstract class OurStoryApiService {
  factory OurStoryApiService(final Dio dio) = _OurStoryApiService;

  @GET(EndPoints.ourStory)
  Future<HttpResponse<OurStoryResponseModel>> getOurStory();
}
