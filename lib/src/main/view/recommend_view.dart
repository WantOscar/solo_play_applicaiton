import 'package:flutter/material.dart';

class RecommendView extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  const RecommendView({super.key, required this.title, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(),
        const SizedBox(
          height: 20.0,
        ),
        _items(),
      ],
    );
  }

  Widget _header() => Padding(
        key: const Key("recommend view header"),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Text(
              title,
              style: titleStyle ??
                  const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      );

  Widget _items() => SingleChildScrollView(
        key: const Key("recommend view items"),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(
              width: 16.0,
            ),
            ...List.generate(
                20,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: RecommendItemWidget(title: "item ${index + 1}"),
                    ))
          ],
        ),
      );
}

class RecommendItemWidget extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  const RecommendItemWidget(
      {super.key, required this.title, this.width = 135, this.height = 109});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: const Color(0xffaaaaaa)),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: _thumNail()),
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _thumNail() => Container(
        key: const Key("recommend item row thum nail"),
        color: Colors.grey,
        alignment: Alignment.center,
        child: const Icon(Icons.add),
      );

  Widget _title() => SizedBox(
      height: 24,
      child: Text(key: const Key("recommend item row title"), title));
}
