import 'package:flutter/material.dart';
import 'package:lab3/providers/cart_provider.dart';
import 'package:lab3/screens/home.dart';
import 'package:lab3/screens/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>CartProvider(),
      child : MaterialApp(
        title: 'My Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber
        ),
        initialRoute: Home.routeName,
        routes: {
          Home.routeName:(context)=> const Home(),
          Shop.routeName:(context)=> const Shop(),
        },
      ),
    );
  }
}



