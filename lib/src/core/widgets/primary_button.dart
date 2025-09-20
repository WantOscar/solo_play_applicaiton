import 'package:flutter/widgets.dart';

class PrimaryButton extends StatelessWidget {
  final Widget? activeChild;
  final Widget? child;
  final void Function()? onTap;
  final double? width;
  final double? height; // Added height property
  const PrimaryButton(
      {super.key,
      this.activeChild,
      this.child,
      this.onTap,
      this.width,
      this.height = 57}); // Added height to constructor with default

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height, // Use the height property
        decoration: BoxDecoration(
            color: onTap != null ? Color(0xff266FF7) : Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: onTap != null ? _renderActiveChild() : child,
      ),
    );
  }

  Widget? _renderActiveChild() {
    if (child != null && activeChild == null) {
      return child;
    } else {
      return activeChild;
    }
  }
}
