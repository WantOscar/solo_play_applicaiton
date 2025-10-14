import 'package:flutter/material.dart';

class PrimaryTagWidget extends StatelessWidget {
  final String? text;
  const PrimaryTagWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xffEEEEEE),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
        child: Center(
          child: Text(
            text ?? "",
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              color: const Color(0xff8E8E8E),
            ),
          ),
        ),
      ),
    );
  }
}
