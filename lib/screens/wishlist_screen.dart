import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => WishlistScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favoritos'),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
              );
          }
            if (state is WishlistLoaded){
              return GridView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal:48.0, vertical: 6.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1.8),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                    product: state.wishlist.products[index],
                    //widthFactor: 1.5,
                    //leftPosition: 100,
                    isWishList: true,
                    )
                  );
                },
              );    
            } else {
              return Text('Algo ha ido mal');
            }
          }
      ),
    );
  }
}
