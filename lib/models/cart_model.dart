import 'package:equatable/equatable.dart';

import 'models.dart';

class Cart extends Equatable {
    final List<Product> products;
    
    const Cart({this.products = const <Product>[]});
  

    Map productQuantity(products){
      var quantity = Map();

      products.forEach((product){
        if (!quantity.containsKey(product)) {
          quantity[product] = 1;
        }else{
          quantity[product] +=1;
        }
      });
      return quantity;
    }

    double get subtotal =>
        products.fold(0, (total, current) => total + current.price);

    String get subtotalString => subtotal.toStringAsFixed(2);

    double deliveryFee(subtotal){
      if (subtotal >= 150) {
        return 0.0;
      }else
        return 10.0;
    }

    double total(subtotal,deliveryFee){
      return subtotal + deliveryFee(subtotal);
    }

    String freeDelivery(subtotal){
      if (subtotal >= 150.0) {
        return 'Envío gratuito';
      } else {
        double missing = 150.0 - subtotal;
        return 'Añade €${missing.toStringAsFixed(2)} para envío gratuito';
      }
    }

    String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
    String get freeDeliveryString => freeDelivery(subtotal);
    String get totalString => total(subtotal,deliveryFee).toStringAsFixed(2);

  

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}