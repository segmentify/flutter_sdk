import '../requests/api_getaway.dart';
import '../constants/app_constants.dart' as constants;
import '../utils/account_config_getter.dart';
import '../models/event_types.dart';
import './events/events.barrel.dart';

// Segmentify Event Sender Class
/// This class represents a Segmentify event.
/// It provides methods to request credentials from the Segmentify API,
/// send different types of events to the Segmentify API,
/// and fire events by sending event payloads to the Segmentify API.
///
/// Example usage:
/// ```dart
/// SegmentifyEvent segmentifyEvent = SegmentifyEvent();
///
/// final credentials = await segmentifyEvent.requestCredentials(2);
///
/// final pageView = PageViewModel(
///  pageType: 'home',
/// pageUrl: 'https://www.example.com',
/// );
///
/// final response = await segmentifyEvent.pageView(pageView);
/// ```
class SegmentifyEvent {
  /// The [dio] property is an instance of the [Dio] class.
  var dio = ApiService().createDio();

  /// Requests credentials from the Segmentify API.
  /// The [requestedFields] parameter is required and represents the number of credentials to be requested.
  /// Returns a list of credentials.
  /// Throws an [Exception] if an error occurs while requesting credentials.
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

  /// Sends a PAGE_VIEW event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> pageView(PageViewModel pageView) async {
    final payload = await pageViewEvent(pageView);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends an INTERACTION event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> interaction(InteractionModel interaction) async {
    final payload = await interactionEvent(interaction);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends a PRODUCT_VIEW event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> productView(ProductViewModel productView) async {
    final payload = await productViewEvent(productView);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends a SEARCH event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> search(SearchModel search) async {
    final payload = await searchEvent(search);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends a BASKET_OPERATION event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> basketOperation(BasketOperationModel basket) async {
    final payload = await basketOperationEvent(basket);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends a CHECKOUT event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> checkout(CheckoutModel checkout) async {
    final payload = await checkoutEvent(checkout);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends a CUSTOM event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> custom(CustomEventModel custom) async {
    final payload = await customEvent(custom);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends a USER_OPERATION event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
  Future<dynamic> userOperation(UserOperationModel user) async {
    final payload = await userOperationEvent(user);
    final response = await _fireEvent(payload);
    return response;
  }

  /// Sends a USER_CHANGE event payload to the Segmentify API.
  /// The [payload] parameter is required and represents the event payload to be sent.
  /// Returns the response data.
  /// Throws an [Exception] if an error occurs while sending the event payload.
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
