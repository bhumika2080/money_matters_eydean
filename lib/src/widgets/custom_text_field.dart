import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneymatter/core/core.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText, hintText, optionalParam;
  final void Function(String text)? onChanged;
  final void Function(String text)? onFieldSubmitted;
  final String? Function(String? value)? validator;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final TextStyle? hintStyle;
  final bool autofocus;
  final bool isRequired;
  final bool obscureText;
  final String obscuringCharacter;
  final int maxLines;
  final int? maxLenght;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText = "",
    this.hintText = "",
    this.optionalParam = "",
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.autofocus = false,
    this.isRequired = false,
    this.maxLines = 1,
    this.maxLenght,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.obscuringCharacter = "X",
    this.fillColor,
    this.onSaved,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late String? errorText = "";
  bool showError = false;

  BoxConstraints iconConstraints = const BoxConstraints(
    minWidth: 40.0,
    minHeight: 40.0,
  );
  TextStyle textStyle = const TextStyle(
    color: Colors.black,
    fontSize: 11.0,
  );
  TextStyle hintTextStyle = TextStyle(
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    overflow: TextOverflow.ellipsis,
    fontSize: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText.isNotEmpty)
          Row(
            children: [
              Text(widget.labelText, style: textStyle.copyWith(fontSize: 13.0)),
              if (widget.optionalParam.isNotEmpty)
                Text("  ${widget.optionalParam}", style: textStyle),
              if (widget.isRequired)
                const Text(' *', style: TextStyle(color: Colors.red)),
              if (showError)
                Text(
                  " $errorText",
                  style: const TextStyle(color: Colors.red, fontSize: 10.0),
                ),
            ],
          ).paddingSymmetric(3.0),
        8.xGap,
        TextFormField(
          controller: widget.controller,
          validator: (value) {
            setState(() {
              errorText = widget.validator?.call(value);
              showError = errorText != null;
            });
            return errorText;
          },
          style: hintTextStyle.copyWith(
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          onSaved: widget.onSaved,
          maxLines: widget.maxLines,
          maxLength: widget.maxLenght,
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatters,
          autofocus: widget.autofocus,
          keyboardType: widget.keyboardType,
          textAlign: widget.textAlign,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: widget.prefixIcon,
            counter: const Offstage(),
            isDense: true,
            fillColor: AppColors().kTableColor,
            hintText: widget.hintText,
            prefixIconConstraints: iconConstraints,
            suffixIconConstraints: iconConstraints,
            hintStyle: widget.hintStyle ?? hintTextStyle,
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.all(12.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: AppColors().primaryColor.shade600),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey.shade200.withOpacity(0.7),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            errorText: null,
            errorStyle: const TextStyle(fontSize: 0.0),
            alignLabelWithHint: true,
          ),
        ),
      ],
    );
  }
}
