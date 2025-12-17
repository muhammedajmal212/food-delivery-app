import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  final Text label;
  final double height;
  final double width;
  final Color color;
  const PriceContainer({
    super.key,
    required this.label,
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),

      child: Center(child: label),
    );
  }
}
