// ignore_for_file: constant_identifier_names
import 'package:flutter_sdk/interceptors/interceptors.barrel.dart';

IPageView pageViewEventExample = IPageView(
  name: 'PAGE_VIEW',
  category: 'category',
  subCategory: 'subCategory',
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'mobile',
  os: 'android',
  lang: 'TR',
);

IInteraction interactionEventExample = IInteraction(
  name: 'INTERACTION',
  type: 'click',
  interactionId: 'interactionId',
  instanceId: 'instanceId',
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'mobile',
  os: 'android',
  lang: 'TR',
);

IProductView productViewEventExample = IProductView(
  name: 'PRODUCT_VIEW',
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
  device: 'mobile',
  os: 'android',
  lang: 'TR',
);

ISearch searchEventExample = ISearch(
  name: 'SEARCH',
  query: 'query',
  type: 'faceted', // Must be 'faceted'
  sessionId: '4020489616172081152',
  userId: '897541074991628287',
  device: 'mobile',
  os: 'android',
  lang: 'TR',
);
