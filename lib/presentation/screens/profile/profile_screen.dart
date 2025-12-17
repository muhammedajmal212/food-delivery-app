import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            provider.signOut(context);
          },
          child: Text("Log Out"),
        ),
      ),
    );
  }
}
