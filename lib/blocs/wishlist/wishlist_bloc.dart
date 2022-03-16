import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/models/wishlist_model.dart';

import '../../models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()){
    on<StartWishlist>(_onLoadWishlist);
    on<AddWishlistProduct>(_onAddWishlistProduct);
    on<RemoveWishlistProduct>(_onRemoveWishlistProduct);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async{
        emit(WishlistLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(WishlistLoaded());
    } catch (_) {
      emit(WishlistError());
    }
  }
  void _onAddWishlistProduct(event, Emitter<WishlistState> emit){
    final state = this.state;
    if (state is WishlistLoaded) {
          List<Product> listProducts = List.from(state.wishlist.products);
      try {
        if(!listProducts.contains(event.product)){
        emit(WishlistLoaded(wishlist: Wishlist(products: listProducts..add(event.product)),),);
        }
      } catch (_) {}
    }
  }
  void _onRemoveWishlistProduct(event, Emitter<WishlistState> emit){
    final state = this.state;
    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(wishlist: Wishlist(products: List.from(state.wishlist.products)..remove(event.product)),),);
      } catch (_) {}
    }
  }
  }