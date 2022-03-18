import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
   on<StartCart>(_onLoadCart);
    on<AddCartProduct>(_onAddCartProduct);
    on<RemoveCartProduct>(_onRemoveCartProduct);
  }

  void _onLoadCart(event, Emitter<CartState> emit) async{
        emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {
      emit(CartError());
    }
  }
  void _onAddCartProduct(event, Emitter<CartState> emit){
    final state = this.state;
    if (state is CartLoaded) {
          List<Product> listProducts = List.from(state.cart.products);
      try {
        emit(CartLoaded(cart: Cart(products: listProducts..add(event.product)),),);
      } catch (_) {}
    }
  }
  void _onRemoveCartProduct(event, Emitter<CartState> emit){
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(CartLoaded(cart: Cart(products: List.from(state.cart.products)..remove(event.product)),),);
      } catch (_) {}
    }
  }
  }