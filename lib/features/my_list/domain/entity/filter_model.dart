class FilterModel {
  final List<String>? categories;
  final double? minPrice;
  final double? maxPrice;
  final int? rating;

  FilterModel({
    this.categories,
    this.minPrice,
    this.maxPrice,
    this.rating,
  });

  Map<String, dynamic> toQueryParameters() {
    final Map<String, dynamic> params = {};
    if (categories != null && categories!.isNotEmpty) {
      params['categories'] = categories!.map((e) => e.toLowerCase()).join(',');
    }
    if (minPrice != null) {
      params['min_price'] = minPrice;
    }
    if (maxPrice != null) {
      params['max_price'] = maxPrice;
    }
    if (rating != null) {
      params['rating'] = rating;
    }
    return params;
  }
}
