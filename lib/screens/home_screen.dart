import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/category/bloc/category_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/product/bloc/product_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'JK SHOP'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                } else {
                  return Text('Algo ha salido mal');
                }
              },
            )),
            Container(
              height: 250,
              width: 800,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 45),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(26)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 117, 11, 131),
              Color.fromARGB(255, 231, 165, 111),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 83, 82, 82).withOpacity(0.3),
              blurRadius: 13,
              spreadRadius: 3,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Stack(
          
          children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(26),
                    bottomRight: Radius.circular(26),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/Vector.svg',
                    width: 800,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(26),
                  bottomRight: Radius.circular(26),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/Vector-1.svg',
                    width: 800,
                  ),
                ),
              ),
            Positioned(
              top: 28,
              left: 28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Las mejores sneakers del mercado",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "haz click para ver todas las disponibles",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),  
            ),
              Padding(
                padding: const EdgeInsets.only(right: 20 ,top: 170.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        iconSize: 50,
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_circle_right,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),      
          ],  
        ),
      ),
      
                 
      
            Container(
                margin: const EdgeInsets.only(top: 50, bottom: 30),
                child: SectionTitle(title: 'RECOMENDADO')),
            //Carousel producto
            //ProductCard(product: Product.products[0],)
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                  return ProductCarousel(
                      products: state.products
                          .where((product) => product.isRecommended)
                          .toList(),
                          );
                } else {
                  return Text('Algo ha salido mal');
                }
              },
            ),
            Container(
                margin: const EdgeInsets.only(top: 50, bottom: 30),
                child: SectionTitle(title: 'POPULAR')),
            //Carousel producto
            //ProductCard(product: Product.products[0],)
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProductLoaded) {
                return ProductCarousel(
                    products: state.products
                        .where((product) => product.isPopular)
                        .toList(),
                        );
                }else{
                  return Text('Algo ha salido mal');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
