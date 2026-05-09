import 'meal.dart';

class Item_ {
  int id;
  Meal_ meal;
  int? quantity;
  int? unitPrice;
  double? discountAmount;
  double? subtotal;

  Item_({
   required   this.id,
  required  this.meal,
    this.quantity,
    this.unitPrice,
    this.discountAmount,
    this.subtotal,
  });

factory Item_.fromJson(Map<String, dynamic> json) => Item_(
  id: json['id'] ?? 0,

  meal: Meal_.fromJson(
    json['meal'] ?? {},
  ),

  quantity: json['quantity'] ?? 0,

  unitPrice: (json['unit_price'] is num)
      ? (json['unit_price'] as num).toInt()
      : 0,

  discountAmount: (json['discount_amount'] is num)
      ? (json['discount_amount'] as num).toDouble()
      : 0.0,

  subtotal: (json['subtotal'] is num)
      ? (json['subtotal'] as num).toDouble()
      : 0.0,
);

  Map<String, dynamic> toJson() => {
        'id': id,
        'meal': meal.toJson(),
        'quantity': quantity,
        'unit_price': unitPrice,
        'discount_amount': discountAmount,
        'subtotal': subtotal,
      };
}
