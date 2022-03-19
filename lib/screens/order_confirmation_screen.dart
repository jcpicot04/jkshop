import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/widgets/widgets.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order-confirmation';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => OrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pedido confirmado'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 500,
                ),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 475),
                  top: 125,
                  child: Image(
                    image: AssetImage('assets/images/check.png'),
                  ),
                ),
                Positioned(
                  top: 435,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Tu compra ha sido aceptada!',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hola,',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Gracias por comprar en JK SHOP.',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Código de pedido: #r234-rep67',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OrderSummary(),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'DETALLES DEL PEDIDO',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(
                        child: CircularProgressIndicator(),
                        );                      }
                      if(state is CartLoaded){
                        List<Product> items = [...{...(state.cart.products)}];
                        print(items);
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return OrderSummaryProductCard(
                            product: items[index],
                            quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                          );
                        },
                      );
                      }else{
                        return Text('Algo ha salido mal');
                      }

                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
