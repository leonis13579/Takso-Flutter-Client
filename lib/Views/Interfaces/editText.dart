import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final ValueChanged<String> onSubmited;
  final Function(String) onValid;
  final String? errorMessage;
  final double? textSize;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final int? flexKoef;
  final String? hintText;
  final Color? backgroundColor;
  final bool? passwordType;

  EditText(
      {required this.onSubmited,
      this.textSize,
      this.controller,
      this.textInputType,
      int? flexKoef,
      this.hintText,
      this.backgroundColor,
      this.passwordType,
      Function(String)? onValid,
      this.errorMessage})
      : this.flexKoef = flexKoef ?? 0,
        this.onValid = onValid ?? ((value) => true);

  @override
  _AndroidTextFieldState createState() =>
      _AndroidTextFieldState(editText: this);
}

class _AndroidTextFieldState extends State<EditText> {
  EditText _editText;

  bool _validate = true;

  _AndroidTextFieldState({required EditText editText})
      : this._editText = editText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: _editText.backgroundColor,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: TextField(
          decoration: InputDecoration(
            errorText: _validate ? null : _editText.errorMessage,
            hintText: _editText.hintText,
          ),
          obscureText: _editText.passwordType ?? false,
          controller: _editText.controller,
          style: TextStyle(
            fontSize: _editText.textSize,
          ),
          onSubmitted: _editText.onSubmited,
          keyboardType: _editText.textInputType,
          onChanged: (value) {
            setState(() {
              _validate = _editText.onValid(value);
              if (_validate) {
                _editText.onSubmited(value);
              }
            });
          },
        ),
      ),
    );
  }
}
