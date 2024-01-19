<h1 align="center">Segmentify Flutter SDK</h1>

<p align='center'>
  <img alt="Version" src="https://img.shields.io/badge/version-0.1.0-blue.svg?cacheSeconds=2592000" />
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
  <a href="https://twitter.com/segmentify" target="_blank">
    <img alt="Twitter: sarpkayature" src="https://img.shields.io/twitter/follow/segmentify.svg?style=social" />
  </a>
</p>

### 🏠 [Homepage](https://www.segmentify.com)

### ✨ Description

Introducing our innovative Flutter app, specifically designed to transform the landscape of e-commerce personalization and segmentation. Built upon the versatile and robust Flutter framework, this app offers a seamless cross-platform experience for both iOS and Android users. It's tailored to empower e-commerce businesses in elevating their customer engagement and retention strategies. With this app, gone are the days of one-size-fits-all marketing approaches. It enables businesses to deeply understand their customers, customizing offerings to individual preferences and behaviors, and thus paving the way for more personalized and effective marketing campaigns.

#### Key Features

- **Personalized Recommendations**: </br> Our app leverages advanced algorithms and machine learning techniques to analyze user behavior, purchase history, and preferences. Based on these insights, it generates personalized product recommendations that are displayed within the app. This helps businesses enhance the user experience, increase conversions, and drive customer loyalty.
- **Dynamic Content**: Delivering the right content to the right audience is crucial in capturing users' attention. Our app allows businesses to dynamically update and customize app content based on user segments. Whether it's displaying targeted banners, promotional offers, or exclusive content, our app ensures that each user sees content relevant to their interests and needs.
- **Search Functionality**: Our app includes a powerful search feature that allows users to quickly find products based on their preferences. Users can search by keywords, filters, categories, or any other relevant attributes. The search results are displayed in real-time, ensuring a smooth and efficient user experience. Businesses can also utilize search analytics to gain insights into popular search terms, customer preferences, and optimize their product offerings.
- **User Segmentation**: Understanding your audience is key to effective marketing. Our app enables businesses to segment their user base using a wide range of criteria, including demographics, purchase history, engagement level, and more. This segmentation capability allows businesses to create highly targeted marketing campaigns and tailor their messaging to specific user groups, resulting in higher engagement and conversion rates.
- **A/B Testing**: Optimizing user experiences and marketing strategies is made easy with our A/B testing feature. Businesses can create multiple versions of app components, such as layouts, UI elements, or promotional content, and test them with different user segments. By measuring and analyzing user interactions and conversion rates, businesses can make data-driven decisions to continuously improve their app's performance and user satisfaction.
- **Seamless Integration**: Our Flutter app seamlessly integrates with existing e-commerce platforms, ensuring a smooth and hassle-free implementation process. Whether you're using popular e-commerce platforms like Shopify or WooCommerce, our app can be easily integrated into your existing infrastructure, allowing you to leverage the power of personalization and segmentation without disrupting your current operations.
- **Analytics and Insights** : In-depth analytics and reporting provide businesses with valuable insights into user behavior, preferences, and campaign performance. Our app provides detailed analytics dashboards, allowing businesses to track key metrics, monitor the success of personalization efforts, and make data-backed decisions to optimize their marketing strategies.
- **Push Notifications**: Our app allows businesses to send personalized push notifications to their users. Businesses can create custom push notifications based on user segments, such as location, demographics, or purchase history. This enables businesses to deliver targeted messages to specific user groups, resulting in higher engagement and conversion rates.

Take your e-commerce business to new heights with our Flutter app that brings personalization and segmentation to the forefront. Engage your users on a personal level, deliver relevant content, and drive conversions like never before. Stay ahead of the competition and build lasting relationships with your customers with our powerful and intuitive app..

## Prerequisites

- `flutter >= v2.8`

## Install

```sh
flutter pub add segmentify-sdk
```

## Usage

Segmentify Flutter App SDK is a Flutter library designed to enable the integration of Segmentify into your Flutter app. It offers a straightforward interface for tracking user behavior and sending events.

This SDK is already coded with Flutter's philosophy in mind, making it a seamless addition to any Flutter project.

### Config

Config is a type that contains the following properties:

- `apiKey`: string (required)
- `dataCenterUrl`: string (required)
- `dataCenterPushUrl`: string (optional)
- `subDomain`: string (required)
- `language`: string (required)

This is the configuration that you can get from Segmentify.

```dart
const Map<String, dynamic> segmentifyConfig = {
  'config': {
    'apiKey': 'your-api-key',
    'dataCenterUrl': 'https://per.segmentify.com',
    'subDomain': 'https://www.yoursite.com',
    'dataCenterPushUrl': 'https://psh.segmentify.com',
    'isApnsEnabled': false,
    'language': 'TR',
  },
  'user': {
    'userId': '',
    'sessionId': '',
  },
};
```

User flow is flexible. You can use it like this as well. In this way segmentify will generate userId and sessionId for you.

### Segmentify Initializer

In this Flutter application, start by importing the flutter_sdk package using the alias Segmentify. Then, in your main method, initialize the package by calling `Segmentify.SegmentifyInitializer` with your specific configuration settings provided in `segmentifyConfig`. This step prepares the package for use throughout your application.

```dart
import 'package:flutter_sdk/main.dart' as Segmentify;
import 'config.dart';


void main() async {
  Segmentify.SegmentifyInitializer(segmentifyConfig: segmentifyConfig);

  runApp(const MyApp());
}
```

### Interaction with Segmentify

If you have access to Segmentify Web Push product, you will need additional steps to integrate Segmentify SDK to your application.
Please follow [here](#integrating-push-notifications) for more information.

The SegmentifyEvent class contains various functions used to send events to _Segmentify_. To use these functions, you need to import types from the _SegmentifyTypes_ module.

To use Segmentify events, you must import the _Segmentify_ and _SegmentifyTypes_ modules at the top of your file like this:

```dart
import 'package:flutter_sdk/main.dart' as Segmentify;
import 'package:flutter_sdk/models/event_types.dart' as SegmentifyTypes;
```

Below is an example of how to use _Segmentify_ events. When creating a model, you can see the required parameters. For instance, a _pageView_ event is created using `SegmentifyTypes.PageViewModel` and sent to _Segmentify_ through `Segmentify.segmentifyEvent`. The variable _responseOfEvent_ captures the response from this event:

```dart
final segmentifyEvent = await Segmentify.segmentifyEvent();

final pageViewPayload = SegmentifyTypes.PageViewModel(category: 'Home Page');
final responseOfEvent = await segmentifyEvent.pageView(pageViewPayload);
```

## Integrating Push Notifications

Segmentify Handles push notification according to your firebase integration. Flutter projects requires an external package for firebase integration. You can find more information from [here](https://firebase.flutter.dev/docs/overview).

### Installation Guide

```sh
flutter pub add firebase_core
flutter pub add firebase_messaging
```

The `firebase_core` and `firebase_messaging` modules must be installed before using any other Firebase service.

### Android Setup

To allow the Android app to securely connect to your Firebase project, a configuration file must be downloaded and added to your project.

#### Generating Android credentials

On the Firebase console, add a new Android application and enter your projects details. The `Android package name` must match your local projects package name which can be found inside of the manifest tag within the `/android/app/src/main/AndroidManifest.xml` file within your project.

Download the `google-services.json` file and place it inside of your project at the following location: `/android/app/google-services.json`.

#### Configure Firebase with Android credentials

To allow Firebase on Android to use the credentials, the `google-services` plugin must be enabled on the project. This requires modification to two files in the Android directory.

First, add the `google-services` plugin as a dependency inside of your `/android/build.gradle` file:

```gradle
buildscript {
  dependencies {
    // ... other dependencies
    classpath 'com.google.gms:google-services:4.3.15'
    // Add me --- /\
  }
}
```

Lastly, execute the plugin by adding the following to your `/android/app/build.gradle` file:

```gradle
apply plugin: 'com.android.application'
apply plugin: 'com.google.gms.google-services' // <- Add this line
```

### iOS Setup

To allow the iOS app to securely connect to your Firebase project, a configuration file must be downloaded and added to your project, and you must enable frameworks in CocoaPods.

#### Generating iOS credentials

On the Firebase console, add a new iOS application and enter your projects details. The "iOS bundle ID" must match your local project bundle ID. The bundle ID can be found within the "General" tab when opening the project with Xcode.

Download the `GoogleService-Info.plist` file.

Using Xcode, open the projects `/ios/{projectName}.xcodeproj` file (or `/ios/{projectName}.xcworkspace` if using Pods).

Right click on the project name and "Add files" to the project, as demonstrated below:

![xcode_step1](https://cdn.segmentify.com/v3/assets/add_files.png)

Select the downloaded `GoogleService-Info.plist` file from your computer, and ensure the "Copy items if needed" checkbox is enabled.

![xcode_step2](https://cdn.segmentify.com/v3/assets/added_files.png)

#### Configure Firebase with iOS credentials

To allow Firebase on iOS to use the credentials, the Firebase iOS SDK must be configured during the bootstrap phase of your application.

To do this, open your `/ios/{projectName}/AppDelegate.mm` file, and add the following:

At the top of the file, import the Firebase SDK right after `#import "AppDelegate.h"`:

```objc
#import <Firebase.h>
```

Then, inside of the `didFinishLaunchingWithOptions` method, add the following:

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Add me --- \/
  [FIRApp configure];
  // Add me --- /\
  // ...
}
```

#### Update Pods

```sh
flutter pub get
cd ios/
pod install --repo-update
cd ..
flutter run
```

Once successfully linked and rebuilt, your application will be connected to Firebase using the `firebase_core` Flutter module. This module alone does not provide extensive functionality, so to utilize other Firebase services, you will need to install separate modules for each Firebase service.

### Highly Recommended

Immediately after installing Segmentify and Firebase in your Flutter project, it's recommended to run the following commands to ensure everything is set up correctly.
This is particularly important for iOS:

```sh
cd ios/
rm -rf Pods
pod deintegrate
pod install --repo-update
cd ..
flutter clean
flutter pub get
flutter run
```

These commands clean and set up the iOS part of your Flutter project and then ensure all Flutter dependencies are correctly fetched and the app is ready to run.

## Integrating Segmentify For Push

To use Segmentify Push, we need to make changes to the initial [SegmentifyInitializer](#segmentify-initializer) part that we did at the beginning. For this, we need to modify the changes we made in the main.dart file as follows.

#### FirebaseOptions

First, you need to create FirebaseOptions to use in Firebase's initialization step.

```dart
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

FirebaseOptions get firebaseOptions {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return const FirebaseOptions(
      appId:
          'android_appId', // google-services.json -> client -> client_info -> mobilesdk_app_id
      apiKey:
          'android_apiKey', // google-services.json -> client -> api_key -> current
      projectId:
          'android_projectId', // google-services.json -> project_info -> project_id
      messagingSenderId:
          'android_messagingSenderId', // google-services.json -> project_info -> project_number
    );
  }

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return const FirebaseOptions(
      appId:
          'ios_appId', // GoogleService-Info.plist -> CLIENT_ID -> REVERSED_CLIENT_ID
      apiKey:
          'ios_apiKey', // GoogleService-Info.plist -> API_KEY -> CURRENT_KEY (or API_KEY)
      projectId:
          'ios_projectId', // GoogleService-Info.plist -> PROJECT_ID (or PROJECT_NUMBER)
      messagingSenderId:
          'ios_messagingSenderId', // GoogleService-Info.plist -> PROJECT_NUMBER (or SENDER_ID)
    );
  }

  throw UnsupportedError('Unsupported platform');
}
```

#### Segmentify Initializer With Push

Segmentify requires your _Firebase_ and _Firebase Messaging_ instance to be passed to SegmentifyInitializer to execute your push flow automatically.

```dart
import 'package:flutter_sdk/main.dart' as Segmentify;
import 'package:flutter_sdk/models/event_types.dart' as SegmentifyTypes;
import 'config.dart';
import 'firebase_options.dart';

void main() async {
  // Initialization for Flutter
  WidgetsFlutterBinding.ensureInitialized();
  // Initialization for Firebase
  await Firebase.initializeApp(options: firebaseOptions); // firebase_options.dart
  // Initialization for Segmentify
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Segmentify.SegmentifyInitializer(segmentifyConfig: segmentifyConfig, messaging: messaging); //

  runApp(const MyApp());
}
```

## Example Application

[Segmentify Demo Application](www.github.com/segmentify/segmentify-react-native-example)

## Reference

- [Flutter Firebase](https://firebase.flutter.dev/)
- [Flutter](https://flutter.dev/)

## Topics

[personalization](https://pub.dev/packages?q=topic:personalization)
[recommendation](https://pub.dev/packages?q=topic:recommendation)
[segmentation](https://pub.dev/packages?q=topic:segmentation)
[push](https://pub.dev/packages?q=topic:push)
[notification](https://pub.dev/packages?q=topic:notification)
[e-commerce](https://pub.dev/packages?q=topic:e-commerce)

## 🤝 Contributors

- [@sarpkayature](https://github.com/sarpkayature)
- [@hasanugur](https://github.com/hasanugr)

Made with ❤️ by Segmentify Development Team
