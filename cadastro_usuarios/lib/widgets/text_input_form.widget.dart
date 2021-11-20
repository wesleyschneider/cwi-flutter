import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFormWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final bool itsPassword;
  final TextInputType? keyboardType;
  final String? initialValue;
  final int? maxLength;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  const TextInputFormWidget({
    Key? key,
    this.controller,
    this.validator,
    this.label,
    this.itsPassword = false,
    this.keyboardType,
    this.initialValue,
    this.maxLength,
    this.textAlign,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _TextInputFormWidgetState createState() => _TextInputFormWidgetState();
}

class _TextInputFormWidgetState extends State<TextInputFormWidget> {
  bool _isHiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.itsPassword ? _isHiddenPass : false,
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: widget.maxLength != null
          ? [LengthLimitingTextInputFormatter(widget.maxLength)]
          : null,
      textAlign: widget.textAlign ?? TextAlign.left,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        suffixIcon: widget.itsPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isHiddenPass = !_isHiddenPass;
                  });
                },
                child: Icon(
                  _isHiddenPass ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
            : null,
      ),
    );
  }
}
