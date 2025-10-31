import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset("assets/images/onboard.png"),
              ),
              SizedBox(height: 20),
              Text(
                "The Fastest\nFood delivery",
                style: AppTextStyles.headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Text(
                "“Delicious food, delivered fast. Wherever you are, we’ve got you covered.",
                textAlign: TextAlign.center,
                style: AppTextStyles.headlineSmall,
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff8c592a),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: 60,
                child: Center(
                  child: Text(
                    "Get Started",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.headlineSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
