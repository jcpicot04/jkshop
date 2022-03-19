import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

import '../screens/screens.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){

    print('Ruta: ${settings.name}');

    switch (settings.name){
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case OrderScreen.routeName:
        return OrderScreen.route();
      default:
        return _errorRoute();

    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title : Text('Error')),
      ),
    );
  }
}