import 'package:flutter/material.dart';

// Generated from Figma components: Rectangle 1/デフォルト, Rectangle 1/バリアント2
class FigmaCard extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const FigmaCard({
    super.key,
    required this.color,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
