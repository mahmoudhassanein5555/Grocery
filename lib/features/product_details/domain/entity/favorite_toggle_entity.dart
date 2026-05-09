import 'package:equatable/equatable.dart';

class FavoriteToggleDataEntity extends Equatable {
  final int mealId;
  final bool isFavorited;

  const FavoriteToggleDataEntity({
    required this.mealId,
    required this.isFavorited,
  });

  @override
  List<Object?> get props => [mealId, isFavorited];
}

class FavoriteToggleEntity extends Equatable {
  final bool success;
  final String message;
  final FavoriteToggleDataEntity data;

  const FavoriteToggleEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [success, message, data];
}
