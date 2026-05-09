import 'item.dart';

class Data_ {
final  int id;
final  String status;
final  List<Item_> items;
final  int itemCount;
 final double subtotal;
final  double tax;
final  dynamic discount;
final  double total;
final  bool isEmpty;
final  DateTime createdAt;
 final DateTime updatedAt;

  Data_({
  required  this.id,
    required  this.status,
    required   this.items,
    required this.itemCount,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.total,
    required this.isEmpty,
    required this.createdAt,
    required this.updatedAt,
  });

factory Data_.fromJson(Map<String, dynamic> json) => Data_(
  id: json['id'] ?? 0,
  status: json['status'] ?? '',

  items: (json['items'] as List<dynamic>? ?? [])
      .map((e) => Item_.fromJson(e as Map<String, dynamic>))
      .toList(),

  itemCount: json['item_count'] ?? 0,

  subtotal: (json['subtotal'] is num)
      ? (json['subtotal'] as num).toDouble()
      : 0.0,

  tax: (json['tax'] is num)
      ? (json['tax'] as num).toDouble()
      : 0.0,

  discount: json['discount'] ?? 0.0,

  total: (json['total'] is num)
      ? (json['total'] as num).toDouble()
      : 0.0,

  isEmpty: json['is_empty'] ?? true,

  createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
  updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
);



  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'items': items?.map((e) => e.toJson()).toList(),
        'item_count': itemCount,
        'subtotal': subtotal,
        'tax': tax,
        'discount': discount,
        'total': total,
        'is_empty': isEmpty,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
