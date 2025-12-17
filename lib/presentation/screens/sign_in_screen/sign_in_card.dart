// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/core/theme/app_text_styles.dart';
// import 'package:food_delivery_app/infrastructure/controllers/auth_controller.dart';
// import 'package:food_delivery_app/presentation/providers/auth_provider.dart';
// import 'package:food_delivery_app/presentation/screens/widgets/app_elevated_button.dart';
// import 'package:food_delivery_app/presentation/screens/widgets/app_form_field.dart';
// import 'package:food_delivery_app/presentation/screens/widgets/auth_bottom_action.dart';
// import 'package:provider/provider.dart';

// class SignInCard extends StatefulWidget {
//   const SignInCard({super.key});

//   @override
//   State<SignInCard> createState() => _SignInCardState();
// }

// class _SignInCardState extends State<SignInCard> {
//   final authController = AuthController();
//   @override
//   void dispose() {
//     authController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     final double height = MediaQuery.of(context).size.height;
//     return Container(
//       height: width > 1040 ? height * 0.9 : height * 0.6,
//       // height: MediaQuery.of(context).size.height * 0.9,
//       margin: EdgeInsets.only(
//         top: MediaQuery.of(context).size.height * 0.38,
//         bottom: 10,
//         left: 20,
//         right: 20,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(20),
//         elevation: 3,
//         child: Container(
//           padding: EdgeInsets.only(left: 10),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 1.8,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(20),
//               topLeft: Radius.circular(20),
//               bottomRight: Radius.circular(20),
//               bottomLeft: Radius.circular(20),
//             ),
//           ),
//           child: Consumer<AuthProvider>(
//             builder: (context, auth, _) {
//               return Form(
//                 key: authController.formkey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 10),
//                     Center(
//                       child: Text(
//                         "Login",
//                         style: AppTextStyles.headlineLarge.copyWith(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),

//                     Text(" Email", style: AppTextStyles.titleLarge),
//                     SizedBox(height: 10),

//                     AppFormField(
//                       controller: authController.emailController,
//                       hintText: " Enter Email",
//                       icon: Icon(Icons.email_outlined),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your email";
//                         }
//                         final emailRegex = RegExp(
//                           r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
//                         );
//                         if (!emailRegex.hasMatch(value)) {
//                           return "Enter a valid email";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20),

//                     Text(" Password", style: AppTextStyles.titleLarge),
//                     SizedBox(height: 10),
//                     AppFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your password";
//                         }
//                         if (value.length < 6) {
//                           return "Password must be at least 6 characters";
//                         }
//                         return null;
//                       },
//                       controller: authController.passwordController,
//                       hintText: " Enter Password",
//                       icon: Icon(Icons.password_outlined),
//                     ),
//                     SizedBox(height: 10),
//                     Padding(
//                       padding: EdgeInsetsGeometry.only(right: 10),
//                       child: Align(
//                         alignment: Alignment.topRight,
//                         child: Text(
//                           "Forgot Password?",
//                           style: AppTextStyles.bodyLarge,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Center(
//                       child: AppElevatedButton(
//                         onPressed: auth.isLoading
//                             ? null
//                             : () async {
//                                 await authController.signIn(context);
//                               },
//                         // onPressed: () {
//                         //   authController.signIn(context);

//                         // },
//                         label: auth.isLoading
//                             ? CircularProgressIndicator()
//                             : Text(
//                                 "Log In",
//                                 style: AppTextStyles.titleLarge.copyWith(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                         height: 60,
//                         width: 200,
//                         color: Color(0xffef2b39),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     AuthBottomAction(
//                       onPresed: () {
//                         Navigator.of(context).pop();
//                       },
//                       questionText: "Don't have an account?",
//                       actionText: "SignUp",
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';
import 'package:food_delivery_app/infrastructure/controllers/auth_controller.dart';
import 'package:food_delivery_app/presentation/providers/auth_provider.dart';
import 'package:food_delivery_app/presentation/screens/sign_up_screen/sign_up_screen.dart';
import 'package:food_delivery_app/presentation/screens/widgets/app_elevated_button.dart';
import 'package:food_delivery_app/presentation/screens/widgets/app_form_field.dart';
import 'package:food_delivery_app/presentation/screens/widgets/auth_bottom_action.dart';
import 'package:provider/provider.dart';

class SignInCard extends StatefulWidget {
  const SignInCard({super.key});

  @override
  State<SignInCard> createState() => _SignInCardState();
}

class _SignInCardState extends State<SignInCard> {
  final authController = AuthController();

  // @override
  // void dispose() {
  //   authController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: width > 1040 ? height * 0.9 : height * 0.6,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.38,
        bottom: 10,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(left: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Consumer<AuthProvider>(
            builder: (context, auth, _) {
              return Form(
                key: authController.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Login",
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Email Field
                    Text(" Email", style: AppTextStyles.titleLarge),
                    SizedBox(height: 10),
                    AppFormField(
                      controller: authController.emailController,
                      hintText: " Enter Email",
                      icon: Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        final emailRegex = RegExp(
                          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),

                    // Password Field
                    Text(" Password", style: AppTextStyles.titleLarge),
                    SizedBox(height: 10),
                    AppFormField(
                      controller: authController.passwordController,
                      hintText: " Enter Password",
                      icon: Icon(Icons.password_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),

                    // Forgot Password
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyles.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Login Button
                    Center(
                      child: AppElevatedButton(
                        onPressed: () async {
                          await authController.signIn(context);
                        },

                        label: Text(
                          "Log In",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        height: 60,
                        width: 200,
                        color: Color(0xffef2b39),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Bottom Action
                    AuthBottomAction(
                      onPresed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => SignUpScreen()),
                        );
                      },
                      questionText: "Don't have an account?",
                      actionText: "SignUp",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
