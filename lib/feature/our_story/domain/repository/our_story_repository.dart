import '../../../../ultis/resources/data_state.dart';
import '../../data/models/our_story_response_model.dart';

abstract class OurStoryRepository {
  Future<DataState<OurStoryResponseModel>> getOurStory();
}
