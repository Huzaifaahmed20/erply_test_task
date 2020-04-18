import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//screens
import './screens/LoginScreen.dart';
import './screens/ProductsScreen.dart';
//providers
import './providers/Auth.dart';
import './providers/Products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(value: Products()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Erply Test Task',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: LoginScreen(),
        routes: {
          ProductsScreen.routeName: (_) => ProductsScreen(),
        },
      ),
    );
  }
}
