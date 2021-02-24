import 'package:app_mercado_libre/src/pages/success_purchase_page.dart';
import 'package:flutter/material.dart';

import 'package:app_mercado_libre/src/pages/home_page.dart';
import 'package:app_mercado_libre/src/pages/login_page.dart';
import 'package:app_mercado_libre/src/pages/check_register_page.dart';
import 'package:app_mercado_libre/src/pages/article_page.dart';
import 'package:app_mercado_libre/src/pages/cart_page.dart';
import 'package:app_mercado_libre/src/pages/address_page.dart';
import 'package:app_mercado_libre/src/pages/credit_card_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
          primaryVariant: Colors.blueAccent[700],

          background: Colors.white,
          onBackground: Colors.black,

          secondary: Colors.lightGreenAccent,
          onSecondary: Colors.black,
          secondaryVariant: Colors.lightGreenAccent,

          error: Colors.black,
          onError: Colors.white,

          brightness: Brightness.light,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        primaryColor: Colors.yellow[600],
      ),
      initialRoute: '/',
      routes: {
        '/' : ( BuildContext context ) => HomePage(),
        '/login' : ( BuildContext context ) => LoginPage(),
        '/checkRegister' : ( BuildContext context ) => CheckRegisterPage(),
        '/article' : ( BuildContext context ) => ArticlePage(),
        '/cart' : ( BuildContext context ) => CartPage(),
        '/address' : ( BuildContext context ) => AddressPage(),
        '/creditCard' : ( BuildContext context ) => CreditCardPage(),
        '/successPurchase' : ( BuildContext context ) => SuccessPurchasePage(),
      },
    );
  }
}
