import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.share, color: Colors.white,)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite, color: Colors.white,)),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.white),onPressed: () {}, child: Text('AÑADIR AL CARRITO', style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 32),),
              )
            ],
          ),
        ),
      ),
      body:
          Container(
            child: ListView(
              children: [ CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: [
                  HeroCarouselCard(
                    product: product,
                )],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      alignment: Alignment.bottomCenter,
                      color: Colors.black.withAlpha(80),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 80,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(product.name, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          Text('€${product.price}', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text('Información del producto', style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold,color: Colors.black)),
                  children: [
                    ListTile(
                      title: Text(
                        'gregerger',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold)),
                    )
                  ]
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text('Información de envío', style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold,color: Colors.black)),
                  children: [
                    ListTile(
                      title: Text(
                        'gregerger',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold)),
                    )
                  ]
                  ),
              ),
              ],
            ),
          ),
    );
  } 
}