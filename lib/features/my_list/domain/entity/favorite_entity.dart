import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final double originalPrice;
  final String imageUrl;

  const FavoriteEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, price, originalPrice, imageUrl];
}
