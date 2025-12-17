import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Widget label;
  final double height;
  final double width;
  final Color color;
  final VoidCallback? onPressed;
  const AppElevatedButton({
    super.key,
    required this.label,
    required this.height,
    required this.width,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton(
    //   onPressed: onPressed,
    //   child: Container(
    //     height: height,
    //     width: width,
    //     decoration: BoxDecoration(
    //       color: color,
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     child: Center(child: label),
    //   ),
    // );
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),

        onPressed: onPressed ?? () {},
        child: Center(child: label),
      ),
    );
  }
}
