import 'package:flutter/material.dart';
import 'package:ecom/login_page.dart';


void main()=>runApp(MyApp());


class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "E commerce example",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}