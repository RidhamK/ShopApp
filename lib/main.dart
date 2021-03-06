import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/auth.dart';
import 'package:shopapp/screens/auth_screen.dart';
import 'package:shopapp/screens/spalsh_screen.dart';
import './provider/cart.dart';
import './provider/order.dart';
import './screens/cart_screen.dart';
import './screens/order_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/edit_product_screen.dart';

import './screens/product_screen_overview.dart';
import './screens/user_product_screen.dart';

import 'provider/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products(null, null, []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Order>(
          create: (ctx) => Order(null, null, []),
          update: (ctx, auth, previousOrder) => Order(
            auth.token,
            auth.userId,
            previousOrder == null ? [] : previousOrder.orders,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Shopping',
          theme: ThemeData(
              primarySwatch: Colors.purple,
              // ignore: deprecated_member_use
              accentColor: Colors.white),
          // home: const ProductOverview(),
          home: auth.isAuth
              ? ProductOverview()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            OrderScreen.routeName: (ctx) => const OrderScreen(),
            UserProduct.routeName: (ctx) => const UserProduct(),
            EditProduct.routeName: (ctx) => const EditProduct(),
            // AuthScreen.routeName: (ctx) => AuthScreen(),
          },
        ),
      ),
    );
  }
}
