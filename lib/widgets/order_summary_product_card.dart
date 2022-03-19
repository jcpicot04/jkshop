import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/models.dart';

class OrderSummaryProductCard extends StatelessWidget {
  const OrderSummaryProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            height: 150,
            width: 250,
            ),
            SizedBox(width: 20,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(product.name, style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                Text('Cantidad: $quantity' ,style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w900),),
              ],
              ),
            ),
            Expanded(
              flex: 2,
              child: 
                Text('€${product.price}', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
        ],
      ),
    );
  }
}