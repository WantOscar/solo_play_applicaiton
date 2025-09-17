import 'package:flutter/material.dart';

class PrimaryBadgeWidget extends StatelessWidget {
  final String text;
  final double? horizontal;
  final double? vertical;
  const PrimaryBadgeWidget({
    super.key,
    required this.text,
    this.horizontal,
    this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff0070F0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontal ?? 0.0, vertical: vertical ?? 0.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}
