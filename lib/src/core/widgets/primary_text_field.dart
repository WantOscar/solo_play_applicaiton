import 'package:flutter/material.dart';

class PrimaryTextField extends TextField {
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool isError;
  PrimaryTextField({
    super.key,
    this.hintText,
    this.hintStyle,
    super.onChanged,
    super.obscureText,
    this.suffixIcon,
    this.suffix,
    this.isError = false,
    super.keyboardType, // Added keyboardType
  }) : super(
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                isDense: true,
                isCollapsed: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(width: 1.0, color: Color(0xff000000)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                        width: 1.0,
                        color:
                            !isError ? Color(0xffcacaca) : Color(0xffff0000))),
                suffixIcon: suffixIcon,
                suffix: suffix));
}
