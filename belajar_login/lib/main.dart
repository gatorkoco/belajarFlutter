import 'package:flutter/material.dart';
import 'package:belajar_login/login_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  final routes = <String,WidgetBuilder>{
    LoginPage.tag: (context)=>LoginPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Serif'
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}