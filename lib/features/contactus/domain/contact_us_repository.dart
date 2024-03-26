import '../../../core/resources/data_state.dart';
import 'contact_us.dart';

abstract class ContactUsRepository {
 Future<DataState<ContactUsEntity>> getContactUs();
}