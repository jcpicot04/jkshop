import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/category/bloc/category_bloc.dart';
import 'package:flutter_ecommerce_app/blocs/product/bloc/product_bloc.dart';
import 'package:flutter_ecommerce_app/models/category_model.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
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
      body: Column(
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
    );
  }
}
