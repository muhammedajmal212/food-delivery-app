// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/presentation/screens/main_screen/main_screen.dart';
// import 'package:food_delivery_app/presentation/screens/sign_up_screen/sign_up_screen.dart';

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasData) {
//           return MainScreen();
//         }
//         return SignUpScreen();
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/providers/auth_provider.dart';
import 'package:food_delivery_app/presentation/screens/main_screen/main_screen.dart';
import 'package:food_delivery_app/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    if (auth.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (auth.user != null) {
      return const MainScreen();
    }

    return const SignInScreen();
  }
}
