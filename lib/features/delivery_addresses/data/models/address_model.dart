// import '../../domain/entities/address_entity.dart';

// class AddressModel extends AddressEntity {
//   AddressModel({
//     super.id,
//     super.label,
//     super.fullName,
//     super.phone,
//     super.streetAddress,
//     super.buildingNumber,
//     super.floor,
//     super.apartment,
//     super.landmark,
//     super.city,
//     super.state,
//     super.postalCode,
//     super.country,
//     super.notes,
//     super.isDefault,
//     super.fullAddress,
//   });

//   factory AddressModel.fromJson(Map<String, dynamic> json) {
//     return AddressModel(
//       id: json['id'],
//       label: json['label'],
//       fullName: json['full_name'],
//       phone: json['phone'],
//       streetAddress: json['street_address'],
//       buildingNumber: json['building_number'],
//       floor: json['floor'],
//       apartment: json['apartment'],
//       landmark: json['landmark'],
//       city: json['city'],
//       state: json['state'],
//       postalCode: json['postal_code'],
//       country: json['country'],
//       notes: json['notes'],
//       isDefault: json['is_default'],
//       fullAddress: json['full_address'],
//     );
//   }


class AddressModel {
  final int? id;
  final String? label;
  final String? fullName;
  final String? phone;
  final String? streetAddress;
  final String? buildingNumber;
  final String? floor;
  final String? apartment;
  final String? landmark;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? notes;
  final bool? isDefault;
  final String? fullAddress;

  AddressModel({
    this.id,
    this.label,
    this.fullName,
    this.phone,
    this.streetAddress,
    this.buildingNumber,
    this.floor,
    this.apartment,
    this.landmark,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.notes,
    this.isDefault,
    this.fullAddress,
  });

factory AddressModel.fromJson(Map<String, dynamic> json) {
  return AddressModel(
    id: json['id'] ?? 0,
    label: json['label'],
    fullName: json['full_name'],
    phone: json['phone'],
    streetAddress: json['street_address'],
    buildingNumber: json['building_number'],
    floor: json['floor'],
    apartment: json['apartment'],
    landmark: json['landmark'],
    city: json['city'],
    state: json['state'],
    postalCode: json['postal_code'],
    country: json['country'],
    notes: json['notes'],
    isDefault: json['is_default'] ?? false,
    fullAddress: json['full_address'],
  );
}


  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'full_name': fullName,
      'phone': phone,
      'street_address': streetAddress,
      'building_number': buildingNumber,
      'floor': floor,
      'apartment': apartment,
      'landmark': landmark,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
      'notes': notes,
      'is_default': isDefault,
    };
  }

}