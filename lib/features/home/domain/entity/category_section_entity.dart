class CategorySectionEntity {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String? imageUrl;
  final int mealsCount;
  final int sortOrder;
  final DateTime createdAt;

  const CategorySectionEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.description,
    this.imageUrl,
    required this.mealsCount,
    required this.sortOrder,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorySectionEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'CategorySectionEntity(id: $id, name: $name)';
}
