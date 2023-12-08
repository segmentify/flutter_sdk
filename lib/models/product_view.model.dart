class ProductViewModel {
  // Required Params
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
  num? price;
  num? oldPrice;
  num? specialPrice;
  int? lastUpdateTime;
  bool? inStock;
  int? stockCount;
  num? stockRatio;
  num? stockStatus;
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
  num? scoreCount;
  int? reviewCount;
  String? subSource;
  Map<String, dynamic>? paramsList;

  // Required Common Params
  String? sessionId;
  String? userId;
  String? device;
  String? os;
  String? lang;

  ProductViewModel({
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
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': 'PRODUCT_VIEW', // PRODUCT_VIEW is required
      'productId': productId,
      if (title != null && title != '') 'title': title,
      if (url != null && url != '') 'url': url,
      if (mUrl != null && mUrl != '') 'mUrl': mUrl,
      if (image != null && image != '') 'image': image,
      if (imageXS != null && imageXS != '') 'imageXS': imageXS,
      if (imageS != null && imageS != '') 'imageS': imageS,
      if (imageM != null && imageM != '') 'imageM': imageM,
      if (imageL != null && imageL != '') 'imageL': imageL,
      if (imageXL != null && imageXL != '') 'imageXL': imageXL,
      if (additionalImages != null) 'additionalImages': additionalImages,
      if (mainCategory != null) 'mainCategory': mainCategory,
      if (category != null && category != '') 'category': category,
      if (categories != null) 'categories': categories,
      if (price != null && price != 0.0) 'price': price,
      if (oldPrice != null && oldPrice != 0.0) 'oldPrice': oldPrice,
      if (specialPrice != null && specialPrice != 0.0) 'specialPrice': specialPrice,
      if (lastUpdateTime != null) 'lastUpdateTime': lastUpdateTime,
      if (inStock != null) 'inStock': inStock,
      if (stockCount != null && stockCount != 0) 'stockCount': stockCount,
      if (stockRatio != null && stockRatio != 0.0) 'stockRatio': stockRatio,
      if (stockStatus != null && stockStatus != 0.0) 'stockStatus': stockStatus,
      if (brand != null && brand != '') 'brand': brand,
      if (gender != null && gender != '') 'gender': gender,
      if (labels != null) 'labels': labels,
      if (sizes != null) 'sizes': sizes,
      if (allSizes != null) 'allSizes': allSizes,
      if (colors != null) 'colors': colors,
      if (publishTime != null) 'publishTime': publishTime,
      if (source != null && source != '') 'source': source,
      if (noUpdate != null) 'noUpdate': noUpdate,
      if (activeBanners != null) 'activeBanners': activeBanners,
      if (groupId != null && groupId != '') 'groupId': groupId,
      if (scoreCount != null && scoreCount != 0.0) 'scoreCount': scoreCount,
      if (reviewCount != null && reviewCount != 0) 'reviewCount': reviewCount,
      if (subSource != null && subSource != '') 'subSource': subSource,
      if (paramsList != null) 'paramsList': paramsList,
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }

  factory ProductViewModel.fromMap(Map<String, dynamic> map) {
    return ProductViewModel(
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
