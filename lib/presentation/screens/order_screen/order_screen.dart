import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Orders", style: AppTextStyles.titleLarge),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFececf8),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),

        height: double.infinity,
        width: double.infinity,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Image.asset(
                  "assets/images/pizza3.png",
                  height: 100,
                  width: 100,
                ),
                SizedBox(width: 50),
                Column(children: [Text("Delivered on Dec 02"), Text("Hello")]),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(thickness: 1, height: 1);
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
