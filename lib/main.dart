import 'package:flutter/material.dart';
import 'package:monkeydosomething/const/colors.dart';
import 'package:monkeydosomething/page/LoginPage.dart';

import 'page/HomePage.dart';
import 'page/Login.dart';
import 'page/SignUp.dart';
import 'page/Home.dart';
import 'page/Menu.dart';
import 'page/info_shop.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food app',
      theme: ThemeData(
        fontFamily: "Matropolis",
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.orange,
            ),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(AppColor.orange))),
        textTheme: TextTheme(
          headline3: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.bold),
          headline4: TextStyle(
              color: AppColor.secondary,
              fontWeight: FontWeight.bold,
              fontSize: 25),
          headline5: TextStyle(
              color: AppColor.primary,
              fontWeight: FontWeight.normal,
              fontSize: 25),
          headline6: TextStyle(color: AppColor.primary, fontSize: 25),
          bodyText2: TextStyle(color: AppColor.secondary),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        Loginpage.routeName: (Context) => Loginpage(),
        Login.routeName: (Context) => Login(),
        SignUp.routeName: (Context) => SignUp(),
        Home.routeName: (Context) => Home(),
        Menu.routeName: (Context) => Menu(),
        InfoShop.routeName: (Context) => InfoShop()
      },
    );
  }
}
