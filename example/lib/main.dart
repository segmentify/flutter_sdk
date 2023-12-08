import 'package:flutter/material.dart';
import 'package:flutter_sdk/main.dart' as Segmentify;
import 'package:flutter_sdk/models/event_types.dart' as SegmentifyTypes;
import 'config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Segmentify Flutter SDK Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  _MyHomePageState() {
    Segmentify.SegmentifyInitializer(segmentifyConfig: segmentifyConfig, logger: true);
  }

  void _incrementCounter()  async{
    final segmentifyEvent = await Segmentify.segmentifyEvent();
    final pageViewPayload = SegmentifyTypes.PageViewModel(category: 'Home Page');
    segmentifyEvent.pageView(pageViewPayload);

    final interactionPayload = SegmentifyTypes.InteractionModel(type: SegmentifyTypes.InteractionTypes.widgetView, interactionId: '1', instanceId: '1');
    segmentifyEvent.interaction(interactionPayload);

    final productViewPayload = SegmentifyTypes.ProductViewModel(productId: '123', title: 'Segmentify Saat', price: 129.99, url: 'https://www.segmentify.com/saat-123');
    segmentifyEvent.productView(productViewPayload);

    final searchClockPayload = SegmentifyTypes.SearchModel(query: 'saat');
    segmentifyEvent.search(searchClockPayload);

    final searchPayload = SegmentifyTypes.SearchModel(query: '');
    segmentifyEvent.search(searchPayload);

    final basketOperationPayload = SegmentifyTypes.BasketOperationModel(step: SegmentifyTypes.BasketOperationSteps.ADD, productId: '32652', quantity: 1, price: 100);
    segmentifyEvent.basketOperation(basketOperationPayload);

    final checkoutPayload = SegmentifyTypes.CheckoutModel(
        step: SegmentifyTypes.CheckoutSteps.PURCHASE,
        totalPrice: 359.99,
        productList: [
          SegmentifyTypes.CheckoutProductModel(productId: '32652', price: 100, quantity: 1),
          SegmentifyTypes.CheckoutProductModel(productId: '12365', price: 259.99, quantity: 2),
        ],
        orderNo: 'order123',
        currency: SegmentifyTypes.CurrencyTypes.TRY,
    );
    segmentifyEvent.checkout(checkoutPayload);

    final customPayload = SegmentifyTypes.CustomEventModel(type: 'Custom Event', params: {'param1': 'param1', 'param2': 'param2'});
    segmentifyEvent.custom(customPayload);

    final userOperationPayload = SegmentifyTypes.UserOperationModel(step: SegmentifyTypes.UserOperationSteps.SIGN_UP, username: 'John Doe', email: 'john@doe.com', age: '25');
    segmentifyEvent.userOperation(userOperationPayload);

    final userChangePayload = SegmentifyTypes.UserChangeModel(oldUserId: 'oldUserId', userId: 'newUserId');
    segmentifyEvent.userChange(userChangePayload);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
