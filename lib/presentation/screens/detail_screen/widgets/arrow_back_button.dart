import 'package:flutter/material.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffef2b39),
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.only(left: 10, top: 10),
      child: const Icon(Icons.arrow_back, size: 30, color: Colors.white),
    );
  }
}
