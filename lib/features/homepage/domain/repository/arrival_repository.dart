import '../../../../core/resources/data_state.dart';
import '../entities/arrival.dart';

abstract class ArrivalRepository{
  Future<DataState<List<ArrivalEntity>>> getArrival();
  Future<DataState<List<JustForYouEntity>>> getJustforyou();
  Future<DataState<List<FollowUsEntity>>> getFollow();
}