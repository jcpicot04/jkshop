import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/models/models.dart';
import 'package:flutter_ecommerce_app/repositories/checkout/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  }) : _cartBloc = cartBloc,
       _checkoutRepository = checkoutRepository,
       super(
         cartBloc.state is CartLoaded
             ? CheckoutLoaded(
               products: (cartBloc.state as CartLoaded).cart.products,
               deliveryFee: (cartBloc.state as CartLoaded).cart.deliveryFeeString,
               subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
               total: (cartBloc.state as CartLoaded).cart.totalString
             )
             : CheckoutLoading(),
       ){
         on<UpdateCheckout>(_onUpdateCheckout);
         on<ConfirmCheckout>(_onConfirmCheckout);

      _cartSubscription = cartBloc.stream.listen((state) {
        if (state is CartLoaded) {
          add(
            UpdateCheckout(cart: state.cart),
          );
        }
       });
       }

void _onUpdateCheckout(
  UpdateCheckout event,
  Emitter<CheckoutState> emit,
  ){
    final state = this.state;
    if (state is CheckoutLoaded) {
      emit(CheckoutLoaded(
        fullName: event.fullName ?? state.fullName,
        email: event.email ?? state.email,
        address: event.address ?? state.address,
        city: event.city ?? state.city,
        country: event.country ?? state.city,
        zipCode: event.zipCode ?? state.city,
        products: event.cart?.products ?? state.products,
        subtotal: event.cart?.subtotalString ?? state.subtotal,
        deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
        total: event.cart?.totalString ?? state.total,
      ),
    ); 
  }
}

void _onConfirmCheckout(
  ConfirmCheckout event,
  Emitter<CheckoutState> emit,
  ) async {
    _checkoutSubscription?.cancel();
    if (state is CheckoutLoaded) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        emit(CheckoutLoading());
      } catch (_) {}
  }
}
}
