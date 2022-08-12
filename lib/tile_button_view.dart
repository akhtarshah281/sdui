import 'package:flutter/material.dart';

import 'custom_image.dart';

class TileButtonView extends StatelessWidget {
  const TileButtonView({
    Key? key,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String? title;
  final String? prefixIcon;
  final String? suffixIcon;

  // String? title;
  // String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: double.infinity,
        child: Material(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Colors.pink, width: 2),
          ),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  const CustomImage(
                    height: 40,
                    width: 40,
                    // imagePath: prefixIcon!,
                    imagePath: 'https://picsum.photos/200/300?random=14',
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
