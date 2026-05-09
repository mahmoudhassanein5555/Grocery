import 'package:grocery1/features/delivery_addresses/data/models/address_model.dart';
import 'package:grocery1/features/delivery_addresses/domain/entities/address_entity.dart';

extension AddressMapper on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(
      id: id ?? 0,
      label: label ?? "",
      fullName: fullName ?? "",
      phone: phone ?? "",
      streetAddress: streetAddress ?? "",
      buildingNumber: buildingNumber ?? "",
      floor: floor ?? "",
      apartment: apartment ?? "",
      landmark: landmark ?? "",
      city: city ?? "",
      state: state ?? "",
      postalCode: postalCode ?? "",
      country: country ?? "",
      notes: notes ?? "",
      isDefault: isDefault ?? false,
      fullAddress: fullAddress ?? "",
    );
  }
}