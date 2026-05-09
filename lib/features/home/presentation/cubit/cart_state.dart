// features/cart/presentation/cubit/cart_state.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
class CartItem extends Equatable {
  final String id;
  final String name;
  final double price;
  final String image;
  final int quantity;

  const CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      price: price,
      image: image,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, name, price, image, quantity];
}

class CartState extends Equatable {
  final List<CartItem> items;

  const CartState({required this.items});

  int get totalItems => items.fold(0, (sum, e) => sum + e.quantity);

  @override
  List<Object?> get props => [items];
}
