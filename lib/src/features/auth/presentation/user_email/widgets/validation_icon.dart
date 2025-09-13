import 'package:flutter/material.dart';

class ValidationIcon extends StatelessWidget {
  final bool isValid;
  const ValidationIcon({super.key, this.isValid = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 19,
        maxHeight: 19,
      ),
      decoration: BoxDecoration(
          color: isValid ? Color(0xff008C15) : Color(0xffff0000),
          shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Icon(
        isValid ? Icons.check_rounded : Icons.close_rounded,
        size: 15.0,
        color: Color(0xffffffff),
      ),
    );
  }
}
