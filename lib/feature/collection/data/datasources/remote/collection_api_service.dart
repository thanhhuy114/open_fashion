import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/responses/collection_response.dart';
import '../../../../../network/end_points.dart';
part 'collection_api_service.g.dart';

@RestApi(baseUrl: EndPoints.baseUrl, parser: Parser.MapSerializable)
abstract class CollectionApiService {
  factory CollectionApiService(Dio dio, {String baseUrl}) =
      _CollectionApiService;

  @GET(EndPoints.collections)
  Future<HttpResponse<CollectionResponse>> getCollection();
}
