import 'package:flutter/material.dart';
import 'package:food_delivery_app/infrastructure/controllers/home_controller.dart';
import 'package:food_delivery_app/infrastructure/service/catetegory_service.dart';
import 'package:food_delivery_app/infrastructure/service/item_service.dart';
import 'package:food_delivery_app/presentation/providers/auth_provider.dart';
import 'package:food_delivery_app/presentation/providers/home_provider.dart';
import 'package:food_delivery_app/presentation/screens/auth_wrapper/auth_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(
            controller: HomeController(
              catetegoryService: CatetegoryService(),
              itemService: ItemService(),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
      ),
    ),
  );
}
