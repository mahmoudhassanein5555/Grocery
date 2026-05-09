import 'package:flutter/material.dart';
import 'package:grocery1/features/product_details/domain/entity/product_details_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/favorite_toggle_entity.dart';
import 'package:grocery1/features/product_details/domain/entity/add_to_cart_entity.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitialState extends ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsSuccessState extends ProductDetailsState {
  final ProductDetailsResponseEntity productDetailsResponseEntity;
  ProductDetailsSuccessState({required this.productDetailsResponseEntity});
}

class ProductDetailsErrorState extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsErrorState({required this.errorMessage});
}

class ProductDetailsToggleFavoriteSuccessState extends ProductDetailsState {
  final FavoriteToggleEntity response;
  ProductDetailsToggleFavoriteSuccessState({required this.response});
}

class ProductDetailsToggleFavoriteErrorState extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsToggleFavoriteErrorState({required this.errorMessage});
}

class ProductDetailsAddToCartSuccessState extends ProductDetailsState {
  final AddToCartEntity response;
  ProductDetailsAddToCartSuccessState({required this.response});
}

class ProductDetailsAddToCartErrorState extends ProductDetailsState {
  final String errorMessage;
  ProductDetailsAddToCartErrorState({required this.errorMessage});
}
