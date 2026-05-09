import 'package:grocery1/features/payment/data/models/data.dart';

abstract class minacartstate {}

class CartInitial extends minacartstate {}

class CartLoading extends minacartstate {}

class CartLoaded extends minacartstate {
  final Data_ data;

  CartLoaded(this.data);
}

class CartError extends minacartstate {
  final String message;

  CartError(this.message);
}