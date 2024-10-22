import 'package:Apna_Store/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/product_list_screen.dart';
import 'screens/cart_screen.dart';
import 'providers/cart_provider.dart';
import 'package:Apna_Store/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Apna Store',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: 'home',
        routes: {
          'home': (context) => Home(),
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
