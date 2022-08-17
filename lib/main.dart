import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sdui_demo/models/sections_model.dart';
import 'package:sdui_demo/tile_button_view.dart';
import 'package:sdui_demo/widget_mapper.dart';

import 'loading.dart';
import 'models/action_model.dart';
import 'models/model.dart';

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
  bool isLoading = true;
  bool isError = false;
  String? errorMessage;

  List<Widget> widgetList = [];

  /// init method to load data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  /// load and print local json object method
  void getData() async {
    await Future.delayed(const Duration(seconds: 2));
    String response =
        await rootBundle.loadString('assets/mock_json/tile_button.json');

    debugPrint('-----------RESPONSE===>$response');

    try {
      ResponseModel responseModel = responseModelFromJson(response);

      if (responseModel.data != null && responseModel.data!.sections != null) {
        for (SectionsModel sectionsModel in responseModel.data!.sections!) {
          if (sectionsModel.en != null) {
            widgetList.add(
                await WidgetMapper.getWidget(languageModel: sectionsModel.en!));
          } else {
            widgetList.add(
                await WidgetMapper.getWidget(languageModel: sectionsModel.ar!));
          }
        }
      }
      setState(() => isLoading = false);
    } catch (e) {
      setState(() {
        isLoading = false;
        isError = true;
        errorMessage = 'Error :: $e';
      });
    }
  }

  /// main build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Loading()
          : isError
              ? Text(errorMessage!)
              : ListView.separated(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  itemBuilder: (context, index) {
                    return widgetList[index];
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 20);
                  },
                  itemCount: widgetList.length),
    );
  }
}
