import 'package:flutter/material.dart';

import 'models/arguments_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ArgumentsModel arguments =
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentsModel;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(args.title!),
            const SizedBox(height: 10),
            Text(args.subTitle!),
            const SizedBox(height: 10),
            Text(args.uiType!),
          ],
        ),
      ),
    );
  }
}
