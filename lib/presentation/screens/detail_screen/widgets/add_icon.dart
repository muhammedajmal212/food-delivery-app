import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xffef2b39),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: Icon(Icons.add, size: 32, color: Colors.white)),
    );
  }
}
