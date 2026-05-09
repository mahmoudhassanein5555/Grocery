class FavoriteToggleDataEntity {
  bool success;
  String message;
  DataEntity data;

  FavoriteToggleDataEntity({
    this.success = false,
    this.message = "",
    this.data = const DataEntity(),
  });
}

class DataEntity {
  final int mealId;
  final bool isFavorited;

  const DataEntity({this.mealId = 0, this.isFavorited = false});
}
