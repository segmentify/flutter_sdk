import '../requests/api_getaway.dart';
import '../constants/app_constants.dart' as constants;
import '../utils/account_config_getter.dart';
import '../models/event_types.dart';
import './events/events.barrel.dart';

// Segmentify Event Sender Class
class SegmentifyEvent {
  var dio = ApiService().createDio();

  // Request Credentials from Segmentify API (GET)
  Future<List<dynamic>> requestCredentials(int requestedFields) async {
    final response = await dio.get(
        '${constants.dataCenterUrl}${constants.credentialUrl}?count=$requestedFields');
    final responseData = response.data;

    if (response.statusCode == 200 &&
        responseData != null &&
        responseData != '' &&
        responseData != 'null') {
      return responseData;
    }

    throw Exception('Failed to load credentials');
  }

  Future<dynamic> pageView(PageViewModel pageView) async {
    final payload = await pageViewEvent(pageView);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> interaction(InteractionModel interaction) async {
    final payload = await interactionEvent(interaction);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> productView(ProductViewModel productView) async {
    final payload = await productViewEvent(productView);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> search(SearchModel search) async {
    final payload = await searchEvent(search);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> basketOperation(BasketOperationModel basket) async {
    final payload = await basketOperationEvent(basket);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> checkout(CheckoutModel checkout) async {
    final payload = await checkoutEvent(checkout);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> custom(CustomEventModel custom) async {
    final payload = await customEvent(custom);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> userOperation(UserOperationModel user) async {
    final payload = await userOperationEvent(user);
    final response = await _fireEvent(payload);
    return response;
  }

  Future<dynamic> userChange(UserChangeModel user) async {
    final payload = await userChangeEvent(user);
    final response = await _fireEvent(payload);
    return response;
  }

  // Send Event to Segmentify API (POST)
  Future<dynamic> _fireEvent(dynamic eventPayload) async {
    final apiKey = await getApiKey();
    final dataCenterUrl = await getDataCenterUrl();

    final response = await dio.post(
        '$dataCenterUrl${constants.eventUrl}?apiKey=$apiKey',
        data: eventPayload);

    return response.data;
  }
}
