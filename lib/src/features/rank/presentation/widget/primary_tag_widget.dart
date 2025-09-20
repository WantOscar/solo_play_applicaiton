import 'package:flutter/material.dart';

class PrimaryTagWidget extends StatelessWidget {
  final String? text;
  const PrimaryTagWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromRGBO(0, 0, 0, 0.05),
        border: Border.all(
          width: 0.5,
          style: BorderStyle.solid,
          color: const Color.fromRGBO(0, 0, 0, 0.10),
        ),
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
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}
