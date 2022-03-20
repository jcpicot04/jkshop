import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  int numProducts = 0;
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Carrito'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.purple,
          child: Container(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    if (numProducts <= 0) {
                      final snackBar = SnackBar(
                        content: Text('Añade productos al carrito para continuar.'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }else{
                    Navigator.pushNamed(context, '/checkout');
                    }
                  },
                  child: Text(
                    'FINALIZAR COMPRA',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                )
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              numProducts = state.cart.products.length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 50.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Column(
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(state.cart.freeDeliveryString, style: Theme.of(context).textTheme.headline3,),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/wishlist');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    shape: RoundedRectangleBorder(),
                    elevation: 0,
                  ),
                  child:
                    Container(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                      child: Text(
                        'Añade más artículos',
                        style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white,),
                      ),
                    ),
                  ),
                  ],
                  
                ),
            SizedBox(height: 10,),

            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                itemBuilder: (context, index) { 
                  return CartProductCard(product: state.cart.productQuantity(state.cart.products).keys.elementAt(index), quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index));
                 },
              ),      
            )
              ],
            ),
            OrderSummary(),
          ]),
        );
            }else{
              return Text('Algo ha salido mal');
            }
          }
        ));
  }
}
