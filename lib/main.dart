import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zakira/View/Cart/cart_provider.dart';
import 'package:zakira/View/splsh_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ZAKHIRA",
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
