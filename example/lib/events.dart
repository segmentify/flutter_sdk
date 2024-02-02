// ignore_for_file: constant_identifier_names
import 'package:segmentify_flutter_sdk/models/event_types.dart';

PageViewModel pageViewEventExample = PageViewModel(
  category: 'category',
  subCategory: 'subCategory',
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'android',
  os: 'android',
  lang: 'TR',
);

InteractionModel interactionEventExample = InteractionModel(
  type: InteractionTypes.widgetView,
  interactionId: 'interactionId',
  instanceId: 'instanceId',
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'android',
  os: 'android',
  lang: 'TR',
);

ProductViewModel productViewEventExample = ProductViewModel(
  productId: 'prd135246',
  title: 'title',
  url: 'https://www.segmentify.com',
  image: 'https://www.segmentify.com',
  additionalImages: ['https://www.segmentify.com'],
  mainCategory: 'mainCategory',
  category: 'categoryParent > categoryChild',
  price: 100,
  oldPrice: 49.99,
  lastUpdateTime: 1501510936208,
  inStock: true,
  stockCount: 10,
  stockRatio: 75,
  stockStatus: 55,
  brand: 'brand',
  gender: 'gender',
  labels: ['label1', 'label2'],
  sizes: ['size1', 'size2'],
  allSizes: ['allSize1', 'allSize2'],
  colors: ['color1', 'color2'],
  publishTime: 1463306155916,
  noUpdate: false,
  scoreCount: 4.5,
  reviewCount: 28,
  paramsList: {
    'param1': 'param1',
    'param2': 'param2',
  },
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'android',
  os: 'android',
  lang: 'TR',
);

SearchModel searchEventExample = SearchModel(
  query: 'query',
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'android',
  os: 'android',
  lang: 'TR',
);

BasketOperationModel basketOperationEventExample = BasketOperationModel(
  step: BasketOperationSteps.ADD,
  productId: 'prd135246',
  quantity: 1,
  price: 100,
  currency: CurrencyTypes.TRY,
);

CheckoutModel checkoutEventExample = CheckoutModel(
  step: CheckoutSteps.VIEW_BASKET,
  totalPrice: 100,
  currency: CurrencyTypes.TRY,
  productList: [
    CheckoutProductModel(productId: 'prd111', quantity: 1, price: 100),
    CheckoutProductModel(productId: 'prd222', quantity: 3, price: 45.90),
  ],
);

CustomEventModel customEventExample = CustomEventModel(
  type: 'Custom Event',
  params: {
    'param1': 'param1',
    'param2': 'param2',
  },
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'android',
  os: 'android',
  lang: 'TR',
);

UserOperationModel userOperationEventExample = UserOperationModel(
  step: UserOperationSteps.SIGN_UP,
  username: 'John Doe',
  email: 'john@doe.com',
  age: '25',
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'android',
  os: 'android',
  lang: 'TR',
);

UserChangeModel userChangeEventExample = UserChangeModel(
  oldUserId: 'oldUserId',
  userId: 'newUserId',
);
