import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdui_demo/tile_button_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SDUI Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDate();
  }

  void getDate() async {
    await Future.delayed(const Duration(seconds: 2));
    String response =
        await rootBundle.loadString('assets/mock_json/tile_button.json');
    
    
    debugPrint('-----------RESPONSE===>$response');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: TileButtonView()),
    );
  }
}
