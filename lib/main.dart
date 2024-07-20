import 'package:e_com_app_exam/screens/cart_page.dart';
import 'package:e_com_app_exam/screens/detail_page.dart';
import 'package:e_com_app_exam/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    EcomApp(),
  );
}

class EcomApp extends StatelessWidget {
  const EcomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'detail_page': (context) => DetailPage(),
        'cart_page': (context) => CartPage(),
      },
    );
  }
}
