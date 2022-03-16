import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';
import '../config/theme.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

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
      bottomNavigationBar:BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  'FINALIZAR COMPRA',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Añade €20 para envío gratis', style: Theme.of(context).textTheme.headline2,),
                  ElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
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
            CartProductCard(product: Product.products[0],),
            CartProductCard(product: Product.products[1],),
            CartProductCard(product: Product.products[2],),
            CartProductCard(product: Product.products[3],),
            CartProductCard(product: Product.products[4],),
              ],
            ),
            Column(children: [
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SUBTOTAL',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        '€9.99',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ]
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TASA DE ENVÍO',
                      style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        '€2.99',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                   ]
                 ),
                SizedBox(height: 20,),
                 Stack(children: [
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: 60,
                     decoration: BoxDecoration(
                       color: Colors.black.withAlpha(50),
                     ),
                   ),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     margin: const EdgeInsets.all(5.0),
                     height: 50,
                     decoration: BoxDecoration(
                       color: Colors.black,
                     ),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal:40.0),
                       child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(
                          'TOTAL',
                        style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                        ),
                        Text(
                          '€12.98',
                          style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                        ),
                   ]
                 ),
                     ),
                   ),
                 ],)
                ],
              ),
            ),
            ],),
      
          ]),
        ),
      ),
    );
  } 
}