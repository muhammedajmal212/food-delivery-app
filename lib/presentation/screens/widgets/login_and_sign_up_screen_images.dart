import 'package:flutter/material.dart';

class LoginAndSignUpScreenImages extends StatelessWidget {
  const LoginAndSignUpScreenImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/pan.png",
          height: MediaQuery.of(context).size.height * 0.2,
          fit: BoxFit.contain,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
        Image.asset(
          "assets/images/logo.png",
          height: 80,
          width: 200,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
