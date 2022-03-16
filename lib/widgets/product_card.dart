import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          height: 150,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          left: 10,
          child: Container(
            width: MediaQuery.of(context).size.width / 1.5 - 10,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                      ),
                    Text(
                      '\€${product.price}',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  child: IconButton(
                    alignment: Alignment.topCenter,
                    onPressed: () {},
                     icon: Icon(
                       Icons.add_circle,
                       color: Colors.white,
                     ),
                     ),
                ),
              ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}