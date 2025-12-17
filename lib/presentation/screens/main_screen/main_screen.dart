import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/presentation/screens/order_screen/order_screen.dart';
import 'package:food_delivery_app/presentation/screens/profile/profile_screen.dart';
import 'package:food_delivery_app/presentation/screens/wallet_screen/wallet_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int page = 0;
  List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    log(user.toString());
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xffef2b39),
        items: <Widget>[
          Icon(Icons.home),
          Icon(Icons.shopping_bag),
          Icon(Icons.wallet),
          Icon(Icons.person),
        ],
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
      ),
      body: screens[page],
    );
  }
}
