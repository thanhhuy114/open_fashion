import '../../../../ultis/resources/data_state.dart';
import '../../../../ultis/usecase/usecase.dart';
import '../../data/models/our_story_response_model.dart';
import '../repository/our_story_repository.dart';

class GetOurStoryUseCase
    implements UseCase<DataState<OurStoryResponseModel>, void> {
  GetOurStoryUseCase(this._ourStoryRepository);
  final OurStoryRepository _ourStoryRepository;

  @override
  Future<DataState<OurStoryResponseModel>> call({final void params}) {
    return _ourStoryRepository.getOurStory();
  }
}
