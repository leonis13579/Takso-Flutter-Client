import 'package:flutter/material.dart';
import 'package:takso_flutter_client/Views/Interfaces/text.dart';

class Button extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final EdgeInsets? outMargin;
  final Color? colorButton;
  final double? textSize;

  Button({
    required this.content,
    required this.onPressed,
    this.outMargin,
    this.colorButton,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.black12;
              }
              return colorButton ?? Theme.of(context).primaryColor;
            },
          ),
        ),
        onPressed: onPressed,
        child: Container(
          child: CustomText(
            content,
            textSize: textSize,
          ),
          padding: EdgeInsets.all(10),
        ),
      ),
      margin: outMargin,
    );
  }
}
