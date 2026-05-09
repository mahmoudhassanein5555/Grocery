
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery1/features/home/presentation/cubit/cart_state.dart';

import 'package:injectable/injectable.dart';


@injectable
class CartCubit extends Cubit<CartState> {
 
  CartCubit() : super(const CartState(items: []));

 

  void addToCart(CartItem item) {
    final existingIndex = state.items.indexWhere((e) => e.id == item.id);
    if (existingIndex != -1) {
      final updatedItems = List<CartItem>.from(state.items);
      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + 1,
      );
      emit(CartState(items: updatedItems));
    } else {
      emit(CartState(items: [...state.items, item]));
    }
  }

  void removeFromCart(String id) {
    emit(CartState(items: state.items.where((e) => e.id != id).toList()));
  }

  void incrementQuantity(String id) {
    final updatedItems = state.items.map((e) {
      return e.id == id ? e.copyWith(quantity: e.quantity + 1) : e;
    }).toList();
    emit(CartState(items: updatedItems));
  }

  void decrementQuantity(String id) {
    final updatedItems = state.items
        .map((e) {
          if (e.id == id) {
            if (e.quantity <= 1) return null;
            return e.copyWith(quantity: e.quantity - 1);
          }
          return e;
        })
        .whereType<CartItem>()
        .toList();
    emit(CartState(items: updatedItems));
  }

  double get total => state.items.fold(
        0,
        (sum, item) => sum + (item.price * item.quantity),
      );
}
