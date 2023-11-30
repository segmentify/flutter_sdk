class IProductView {
  // Required Params
  String name;
  dynamic productId;

  // Optional Params
  String? title;
  String? url;
  String? mUrl;
  String? image;
  String? imageXS;
  String? imageS;
  String? imageM;
  String? imageL;
  String? imageXL;
  List<String>? additionalImages;
  String? mainCategory;
  String? category;
  List<String>? categories;
  double? price;
  double? oldPrice;
  double? specialPrice;
  int? lastUpdateTime;
  bool? inStock;
  int? stockCount;
  double? stockRatio;
  double? stockStatus;
  String? brand;
  String? gender;
  List<String>? labels;
  List<String>? sizes;
  List<String>? allSizes;
  List<String>? colors;
  int? publishTime;
  String? source;
  bool? noUpdate;
  List<String>? activeBanners;
  String? groupId;
  double? scoreCount;
  int? reviewCount;
  String? subSource;
  Map<String, dynamic>? paramsList;

  // Required Common Params
  String sessionId;
  String userId;
  String device;
  String os;
  String lang;

  IProductView({
    required this.name,
    required this.productId,
    this.title,
    this.url,
    this.mUrl,
    this.image,
    this.imageXS,
    this.imageS,
    this.imageM,
    this.imageL,
    this.imageXL,
    this.additionalImages,
    this.mainCategory,
    this.category,
    this.categories,
    this.price,
    this.oldPrice,
    this.specialPrice,
    this.lastUpdateTime,
    this.inStock,
    this.stockCount,
    this.stockRatio,
    this.stockStatus,
    this.brand,
    this.gender,
    this.labels,
    this.sizes,
    this.allSizes,
    this.colors,
    this.publishTime,
    this.source,
    this.noUpdate,
    this.activeBanners,
    this.groupId,
    this.scoreCount,
    this.reviewCount,
    this.subSource,
    this.paramsList,
    required this.sessionId,
    required this.userId,
    required this.device,
    required this.os,
    required this.lang,
  });

  factory IProductView.fromMap(Map<String, dynamic> map) {
    return IProductView(
      name: map['name'],
      productId: map['productId'],
      title: map['title'],
      url: map['url'],
      mUrl: map['mUrl'],
      image: map['image'],
      imageXS: map['imageXS'],
      imageS: map['imageS'],
      imageM: map['imageM'],
      imageL: map['imageL'],
      imageXL: map['imageXL'],
      additionalImages: map['additionalImages'],
      mainCategory: map['mainCategory'],
      category: map['category'],
      categories: map['categories'],
      price: map['price'],
      oldPrice: map['oldPrice'],
      specialPrice: map['specialPrice'],
      lastUpdateTime: map['lastUpdateTime'],
      inStock: map['inStock'],
      stockCount: map['stockCount'],
      stockRatio: map['stockRatio'],
      stockStatus: map['stockStatus'],
      brand: map['brand'],
      gender: map['gender'],
      labels: map['labels'],
      sizes: map['sizes'],
      allSizes: map['allSizes'],
      colors: map['colors'],
      publishTime: map['publishTime'],
      source: map['source'],
      noUpdate: map['noUpdate'],
      activeBanners: map['activeBanners'],
      groupId: map['groupId'],
      scoreCount: map['scoreCount'],
      reviewCount: map['reviewCount'],
      subSource: map['subSource'],
      paramsList: map['paramsList'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }
}
