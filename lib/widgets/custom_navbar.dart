import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;
  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.purple,
      child: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      case '/order-confirmation':
        return _buildConfirmNowNavBar(context);
      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
          icon: Icon(Icons.home, color: Colors.white, size: 40),
          onPressed: () {
            if (ModalRoute.of(context)!.settings.name == '/') {
              null;
            } else {
              Navigator.pushNamed(context, '/');
            }
          }),
      IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.white, size: 40),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          }),
      IconButton(
          icon: Icon(Icons.person, color: Colors.white, size: 40),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          }),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));

                Navigator.pushNamedAndRemoveUntil(context,'/order-confirmation',(Route<dynamic> route) => false);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'COMPRAR',
                style: Theme.of(context).textTheme.headline3,
              )
              );
          } else{
            return Text('Algo ha salido mal');
          }

        },
      ),
    ];
  }

  List<Widget> _buildConfirmNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));

                Navigator.pushNamedAndRemoveUntil(context,'/',(Route<dynamic> route) => false);
                state.products?.clear();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'Volver a la tienda',
                style: Theme.of(context).textTheme.headline3,
              )
              );
          } else{
            return Text('Algo ha salido mal');
          }

        },
      ),
    ];
  }
}
