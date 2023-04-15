import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/utilities.dart';

class IconBox extends StatelessWidget {
  final String text;
  final Color color;
  final String image;
  final VoidCallback onPressed;
  const IconBox(
      {super.key,
      required this.text,
      required this.color,
      required this.image,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppDimensions.width(context) * 0.045),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              width: AppDimensions.width(context) * 0.165,
              height: AppDimensions.width(context) * 0.165,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                image,
                fit: BoxFit.cover,
                width: AppDimensions.width(context) * 0.08,
                height: AppDimensions.width(context) * 0.08,
              ),
            ),
            SizedBox(height: AppDimensions.height(context) * 0.0075),
            Text(text, style: AppTextStyle.regularText14(context)),
          ],
        ),
      ),
    );
  }
}
