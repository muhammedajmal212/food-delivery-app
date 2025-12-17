// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/presentation/providers/auth_provider.dart';
// import 'package:provider/provider.dart';

// class AuthController {
//   final formkey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   void signup(BuildContext context) async {
//     if (!formkey.currentState!.validate()) return;

//     final provider = context.read<AuthProvider>();
//     final messenger = ScaffoldMessenger.of(context);

//     try {
//       final user = await provider.signUp(
//         name: nameController.text.trim(),
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       if (user != null) {
//         messenger.hideCurrentSnackBar();
//         messenger.showSnackBar(
//           const SnackBar(
//             margin: EdgeInsets.all(16),
//             behavior: SnackBarBehavior.floating,
//             backgroundColor: Colors.green,
//             content: Text(
//               "Registration successful!",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         );

//         // ❌ NO navigation needed
//       }

//       nameController.clear();
//       emailController.clear();
//       passwordController.clear();
//     } catch (e) {
//       messenger.hideCurrentSnackBar();
//       messenger.showSnackBar(
//         SnackBar(
//           margin: const EdgeInsets.all(16),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: Colors.red,
//           content: Text(
//             e.toString().replaceAll("Exception:", "").trim(),
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       );
//     }
//   }

//   Future<void> signIn(BuildContext context) async {
//     if (!formkey.currentState!.validate()) return;

//     final provider = context.read<AuthProvider>();
//     final messenger = ScaffoldMessenger.of(context);

//     try {
//       final user = await provider.signIn(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       if (user != null) {
//         messenger.hideCurrentSnackBar();
//         messenger.showSnackBar(
//           const SnackBar(
//             margin: EdgeInsets.all(16),
//             behavior: SnackBarBehavior.floating,
//             backgroundColor: Colors.green,
//             content: Text(
//               "Log-in success",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         );
//         // ❌ NO navigation
//       }

//       emailController.clear();
//       passwordController.clear();
//     } catch (e) {
//       messenger.showSnackBar(
//         SnackBar(
//           margin: const EdgeInsets.all(16),
//           backgroundColor: Colors.red,
//           behavior: SnackBarBehavior.floating,
//           content: Text(
//             e.toString().replaceAll("Exception:", "").trim(),
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       );
//     }
//   }

//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/providers/auth_provider.dart'
    show AuthProvider;
import 'package:food_delivery_app/presentation/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/presentation/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

class AuthController {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signup(BuildContext context) async {
    if (!formkey.currentState!.validate()) return;

    final provider = context.read<AuthProvider>();
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);

    try {
      await provider.signUp(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // ✅ SUCCESS (no user check)
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        const SnackBar(
          margin: EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text(
            "Registration successful!",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      navigator.pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => MainScreen()),
        (route) => false,
      );
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    } catch (e) {
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(
            e.toString().replaceAll("Exception:", "").trim(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  Future<void> signIn(BuildContext context) async {
    if (!formkey.currentState!.validate()) return;

    final provider = context.read<AuthProvider>();
    final messenger = ScaffoldMessenger.of(context);

    try {
      await provider.signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        const SnackBar(
          margin: EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text(
            "Log-in success",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      emailController.clear();
      passwordController.clear();
    } catch (e) {
      messenger.showSnackBar(
        SnackBar(
          margin: const EdgeInsets.all(16),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          content: Text(
            e.toString().replaceAll("Exception:", "").trim(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
