class Category_ {
  int? id;
  String? name;

  Category_({this.id, this.name});

  factory Category_.fromJson(Map<String, dynamic> json) => Category_(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
