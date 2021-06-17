import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double textSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? color;
  final EdgeInsets? outMargin;

  CustomText(
    this.data, {
    double? textSize,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.outMargin,
  }) : this.textSize = textSize ?? 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: outMargin,
      child: Text(
        data,
        style: TextStyle(
          fontSize: (textSize * MediaQuery.of(context).textScaleFactor),
          fontWeight: fontWeight,
          color: color,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
