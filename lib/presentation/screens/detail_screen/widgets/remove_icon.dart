import 'package:flutter/material.dart';

class RemoveIcon extends StatelessWidget {
  const RemoveIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffef2b39),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.remove, size: 32, color: Colors.white),
    );
  }
}
