import 'package:flutter_sdk/enums/Currency.enum.dart';
export 'package:flutter_sdk/enums/Currency.enum.dart';

enum CheckoutSteps {
  CUSTOMER_INFO,
  VIEW_BASKET,
  PAYMENT_INFO,
  PURCHASE,
}

String getCheckoutStep(CheckoutSteps step) {
  switch (step) {
    case CheckoutSteps.CUSTOMER_INFO:
      return 'customer-info';
    case CheckoutSteps.VIEW_BASKET:
      return 'view-basket';
    case CheckoutSteps.PAYMENT_INFO:
      return 'payment-info';
    case CheckoutSteps.PURCHASE:
      return 'purchase';
    default:
      throw Exception('Checkout step is not defined.');
  }
}

class CheckoutProductModel {
  // Required Params
  String productId;

  // Optional Params
  num? price;
  num? quantity;
  CurrencyTypes? currency;

  CheckoutProductModel({
    required this.productId,
    this.price,
    this.quantity,
    this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (currency != null) 'currency': getCurrencyType(currency!),
    };
  }
}

class CheckoutModel {
  // Required Params
  CheckoutSteps step;
  num totalPrice;
  List<CheckoutProductModel> productList;

  // Optional Params
  String? orderNo;
  CurrencyTypes? currency;

  // Required Common Params
  String? sessionId;
  String? userId;
  String? device;
  String? os;
  String? lang;

  CheckoutModel({
    required this.step,
    required this.totalPrice,
    required this.productList,
    this.orderNo,
    this.currency,
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  factory CheckoutModel.fromMap(Map<String, dynamic> map) {
    return CheckoutModel(
      step: map['step'],
      totalPrice: map['totalPrice'],
      productList: map['productList'],
      orderNo: map['orderNo'],
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
      'name': 'CHECKOUT', // CHECKOUT is required
      'step': getCheckoutStep(step),
      'totalPrice': totalPrice,
      'productList': productList.map((product) => product.toMap()).toList(),
      if (orderNo != null && orderNo != '') 'orderNo': orderNo,
      if (currency != null) 'currency': getCurrencyType(currency!),
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }
}
