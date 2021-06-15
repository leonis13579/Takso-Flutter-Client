import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double? textSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final EdgeInsets? outMargin;

  CustomText(
    this.data, {
    this.textSize,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.outMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: outMargin,
      child: Text(
        data,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: fontWeight,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
