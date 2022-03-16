import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular
  });


  @override
  // TODO: implement props
  List<Object?> get props => [name,category,imageUrl,price,isRecommended,isPopular];

  static List<Product> products = [

    Product(
      name: 'Yeezy 700',
      category: 'Adidas',
      imageUrl: 'https://cdn.shopify.com/s/files/1/2358/2817/products/yeezy-700-wave-runner-solid-grey-101579.png?v=1638814800',
      price: 300,
      isRecommended: true,
      isPopular: true
    ),
    Product(
      name: 'Yeezy 500',
      category: 'Adidas',
      imageUrl: 'https://cdn.shopify.com/s/files/1/2358/2817/products/yeezy-500-utility-black-618782.png?v=1638814714',
      price: 200,
      isRecommended: false,
      isPopular: true
    ),
    Product(
      name: 'Dunk High Panda',
      category: 'Nike',
      imageUrl: 'https://hypescrape.com/wp-content/uploads/2021/06/Wethenew-Sneakers-France-Nike-Dunk-High-Panda-2021-DD1869-103-2_1200x_449d6c7a-01cb-4b20-93b8-912883ebcdb4.png',
      price: 140,
      isRecommended: true,
      isPopular: false
    ),
    Product(
      name: 'University Blue',
      category: 'Jordan',
      imageUrl: 'https://hypescrape.com/wp-content/uploads/2021/04/Wethenew-Sneakers-France-Air-Jordan-1-Retro-High-University-Blue-555088-134-2_1200x_ebb5c8fc-7f04-4c9d-abca-0c19569b0507.png',
      price: 120,
      isRecommended: false,
      isPopular: true
    ),
    Product(
      name: 'Chicago',
      category: 'Jordan',
      imageUrl: 'https://media.revistagq.com/photos/61dd4e2485933dd83bb3cbd3/master/w_1280,h_854,c_limit/air%20jordan%201%20chicago.jpeg',
      price: 120,
      isRecommended: true,
      isPopular: false
    ),

  ];
}