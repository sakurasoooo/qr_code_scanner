import 'package:flutter/material.dart';
// import 'screens/business_screen.dart';
// import 'screens/predictor_screen.dart';
// import 'screens/resume_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe DEMO',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainTabController(),
    );
  }
}

class MainTabController extends StatelessWidget {
  // static const tabs = [
  //   Tab(
  //       child: Icon(
  //     Icons.face,
  //     color: Colors.pink,
  //     size: 24.0,
  //     semanticLabel: 'Business',
  //   )),
  //   Tab(
  //       child: Icon(
  //     Icons.description,
  //     color: Colors.pink,
  //     size: 24.0,
  //     semanticLabel: 'Resume',
  //   )),
  //   Tab(
  //       child: Icon(
  //     Icons.help_outline,
  //     color: Colors.pink,
  //     size: 24.0,
  //     semanticLabel: 'Predictor',
  //   ))
  // ];

  // final screens = [BusinessScreen(), ResumeScreen(), PredictorScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            //backgroundColor: Colors.blue[300],
            appBar: AppBar(
              title: Text('Call Me Maybe'),
              //bottom: TabBar(tabs: tabs),
            ),
            body: TabBarView(
              children: [],
            )));
  }
}
