import 'package:equatable/equatable.dart';

class HistoryEntity extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final double rating;
  final int ratingCount;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final bool isFavorite;

  const HistoryEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    this.isFavorite = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        rating,
        ratingCount,
        price,
        originalPrice,
        imageUrl,
        isFavorite,
      ];
}

class HistoryResponseEntity {
  bool? success;
  String? message;
  List<HistoryEntity>? data;

  HistoryResponseEntity({this.success, this.message, this.data});
}
