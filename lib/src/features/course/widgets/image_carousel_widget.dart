import 'dart:async';

import 'package:flutter/material.dart';

class ImageCarouselWidget extends StatefulWidget {
  final List<ImageProvider> images;
  final double height;
  final double borderRadius;
  final bool autoPlay;
  final Duration autoPlayInterval;
  const ImageCarouselWidget(
      {super.key,
      required this.images,
      this.height = 420,
      this.borderRadius = 16,
      this.autoPlay = false,
      this.autoPlayInterval = const Duration(seconds: 4)})
      : assert(images.length > 0, 'images must not be empty');

  @override
  State<ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<ImageCarouselWidget> {
  late final PageController _pageController;
  int _current = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    if (widget.autoPlay && widget.images.length > 1) {
      _timer = Timer.periodic(widget.autoPlayInterval, (_) {
        if (!mounted) return;
        final next = (_current + 1) % widget.images.length;
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: SizedBox(
        height: widget.height,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (i) => setState(() => _current = i),
              itemBuilder: (_, i) {
                return Container(
                  color: const Color(0xFFEFEFEF),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: Image(image: widget.images[i]),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 12,
              child: _DotsIndicator(
                count: widget.images.length,
                index: _current,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int count;
  final int index;

  const _DotsIndicator({required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (i) {
        final selected = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: selected ? 18 : 6,
          decoration: BoxDecoration(
            color: !selected
                ? Colors.white.withOpacity(0.55)
                : Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
