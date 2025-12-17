import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/screens/sign_in_screen/sign_in_card.dart'
    show SignInCard;
import 'package:food_delivery_app/presentation/screens/widgets/login_and_sign_up_screen_images.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.45,

                    // color: Colors.blue,
                    decoration: BoxDecoration(
                      color: Color(0xffffefbf),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: LoginAndSignUpScreenImages(),
                  ),
                ],
              ),
              SignInCard(),
            ],
          ),
        ),
      ),
    );
  }
}
