import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    this.backgroundColor,
    this.color,
    this.strokeWidth = 4.0,
    this.loadingWidget,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? color;
  final double strokeWidth;

  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Center(child: _getLoader(context)),
    );
  }

  Widget _getLoader(context) {
    if (loadingWidget == null) {
      return CircularProgressIndicator(
        backgroundColor: backgroundColor,
        color: color ?? Theme.of(context).primaryColor,
        strokeWidth: strokeWidth,
      );
    } else {
      return loadingWidget!;
    }
  }
}
