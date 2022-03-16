import 'package:flutter/material.dart';

import '../models/models.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({
     Key? key,
     required this.product,
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0,bottom: 8.0),
      child: Row(children: [
        Image.network(
        product.imageUrl,
        width: 440,
        height: 190,
        fit: BoxFit.cover,
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            children: [
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline5,
              ),
            Text(
              '\€${product.price}',
              style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ),      
      SizedBox(width: 10,),
      Row(children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.remove_circle)),
        Text('1',style: Theme.of(context).textTheme.headline5,),
        IconButton(onPressed: () {}, icon: Icon(Icons.add_circle)),
      ],)
      ],
      ),
    );
}
}