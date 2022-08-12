import 'package:flutter/material.dart';

import 'custom_image.dart';

class TileButtonView extends StatelessWidget {
  const TileButtonView({
    Key? key,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.margin = const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
  }) : super(key: key);

  final String? title;
  final String? prefixIcon;
  final String? suffixIcon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry margin;
  final double borderWidth;
  final Color? backgroundColor, borderColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 60,
      width: double.infinity,
      child: Material(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor!, width: borderWidth),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  CustomImage(
                    height: 40,
                    width: 40,
                    imagePath: prefixIcon!,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(width: 15),
                ],
                if (title != null)
                  Expanded(
                    child: Text(title!),
                  ),
                if (suffixIcon != null)
                  CustomImage(
                    imagePath: prefixIcon!,
                    height: 15,
                    width: 15,
                    borderRadius: BorderRadius.circular(10),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
