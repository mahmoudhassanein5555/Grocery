class CategoryEntity {
  final int id;
  final String name;
  final String? slug;

  const CategoryEntity({
    required this.id,
    required this.name,
    this.slug,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryEntity &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
