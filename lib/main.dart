import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app_state_management/models/cart.dart';
import 'package:provider_app_state_management/models/catalog.dart';
import 'package:provider_app_state_management/screens/cart.dart';
import 'package:provider_app_state_management/screens/catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MultiProvider makes it convenient to provide information to multiple objects.
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
          title: 'A provider demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => MyCatalog(),
            '/cart': (context) => MyCart(),
          }),
    );
  }
}
