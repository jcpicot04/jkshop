import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name;
  final String imageUrl;

  const Category ({
    required this.name,
    required this.imageUrl,
    
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];
  
  static List<Category> categories = [
    Category(
      name: 'Jordan',
       imageUrl: 'https://images.unsplash.com/photo-1612181346599-a6bfbd67be86?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2574&q=80'
       ),
    Category(
      name: 'Nike',
       imageUrl: 'https://images.unsplash.com/photo-1626379616459-b2ce1d9decbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
       ),
    Category(
      name: 'Adidas',
       imageUrl: 'https://images.unsplash.com/photo-1626771652942-93d834f3d1fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80'
       ),
  ];
}

