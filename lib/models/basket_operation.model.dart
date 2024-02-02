import 'package:segmentify_flutter_sdk/enums/Currency.enum.dart';
export 'package:segmentify_flutter_sdk/enums/Currency.enum.dart';

enum BasketOperationSteps {
  ADD,
  REMOVE,
}

String getBasketOperationStep(BasketOperationSteps step) {
  switch (step) {
    case BasketOperationSteps.ADD:
      return 'add';
    case BasketOperationSteps.REMOVE:
      return 'remove';
    default:
      throw Exception('Basket operation step is not defined.');
  }
}

class BasketOperationModel {
  // Required Params
  BasketOperationSteps step;
  String productId;

  // Optional Params
  num? price;
  num? quantity;
  CurrencyTypes? currency;

  // Required Common Params
  String? sessionId;
  String? userId;
  String? device;
  String? os;
  String? lang;

  BasketOperationModel({
    required this.step,
    required this.productId,
    this.price,
    this.quantity,
    this.currency,
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  factory BasketOperationModel.fromMap(Map<String, dynamic> map) {
    return BasketOperationModel(
      step: map['step'],
      productId: map['productId'],
      price: map['price'],
      quantity: map['quantity'],
      currency: map['currency'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': 'BASKET_OPERATIONS', // BASKET_OPERATION is required
      'step': getBasketOperationStep(step),
      'productId': productId,
      if (price != null && price != 0) 'price': price,
      if (quantity != null && quantity != 0) 'quantity': quantity,
      if (currency != null) 'currency': getCurrencyType(currency!),
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }
}
