import 'package:flutter/material.dart';

import '../models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;

  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 1.5,
    this.leftPosition = 5,
    this.isWishList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue - 10,
            height: 160,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - 20 - leftPosition,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.white,
                          ),
                          ),
                        Text(
                          '\€${product.price}',
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.white,
                          ),
                          ),
                      ],
                      
                    ),
                  ),
                      Expanded(
                        child: IconButton(
                          alignment: Alignment.topCenter,
                          onPressed: () {},
                           icon: Icon(
                             Icons.add_circle,
                             color: Colors.white,
                           ),
                           ),
                      ),
                      isWishList ?
                      Expanded(
                        child: IconButton(
                          alignment: Alignment.topCenter,
                          onPressed: () {},
                           icon: Icon(
                             Icons.delete,
                             color: Colors.white,
                           ),
                           ),
                      ) : SizedBox(),
                ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}