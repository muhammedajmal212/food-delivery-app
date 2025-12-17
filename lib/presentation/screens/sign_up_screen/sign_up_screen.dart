import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_text_styles.dart';
import 'package:food_delivery_app/infrastructure/controllers/auth_controller.dart';
import 'package:food_delivery_app/presentation/providers/auth_provider.dart';
import 'package:food_delivery_app/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery_app/presentation/screens/widgets/app_elevated_button.dart';
import 'package:food_delivery_app/presentation/screens/widgets/app_form_field.dart';
import 'package:food_delivery_app/presentation/screens/widgets/auth_bottom_action.dart';
import 'package:food_delivery_app/presentation/screens/widgets/login_and_sign_up_screen_images.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final AuthController _controller = AuthController();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              Container(
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
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Form(
                      key: _controller.formkey,
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                "SignUp",
                                style: AppTextStyles.headlineLarge.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(" Name", style: AppTextStyles.titleLarge),
                            SizedBox(height: 10),
                            AppFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your name";
                                }
                                if (value.length < 3) {
                                  return "Name must be at least 3 characters";
                                }
                                if (value.length > 25) {
                                  return "Name must be under 25 characters";
                                }
                                return null;
                              },
                              hintText: "Enter Name",
                              icon: Icon(Icons.person),
                              controller: _controller.nameController,
                            ),

                            SizedBox(height: 20),
                            Text(" Email", style: AppTextStyles.titleLarge),
                            SizedBox(height: 10),
                            AppFormField(
                              hintText: " Enter Email",
                              icon: Icon(Icons.email_outlined),
                              controller: _controller.emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                }
                                final emailregex = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                );
                                if (!emailregex.hasMatch(value)) {
                                  return "Please enter a valid emeil";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            Text(" Password", style: AppTextStyles.titleLarge),
                            SizedBox(height: 10),
                            AppFormField(
                              hintText: "Enter password",
                              icon: Icon(Icons.password_outlined),
                              controller: _controller.passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter password";
                                }
                                if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 20),
                            Center(
                              child: AppElevatedButton(
                                onPressed: () async {
                                  if (authProvider.isLoading) {}
                                  _controller.signup(context);
                                },
                                label: Text(
                                  "SignUp",
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
                            AuthBottomAction(
                              onPresed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => SignInScreen(),
                                ),
                              ),
                              questionText: "Already have an account?",
                              actionText: "Login",
                            ),
                          ],
                        ),
                      ),
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
