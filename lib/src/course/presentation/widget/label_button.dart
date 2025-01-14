import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final String label;
  const LabelButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(24.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(label)),
        ),
      ),
    );
  }
}
