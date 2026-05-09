class AddressEntity {
  final int id;
  final String label;
  final String fullName;
  final String phone;
  final String streetAddress;
  final String buildingNumber;
  final String floor;
  final String apartment;
  final String landmark;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String notes;
  final bool isDefault;
  final String fullAddress;

  AddressEntity({
    this.id = 0,
    this.label = "",
    this.fullName = "",
    this.phone = "",
    this.streetAddress = "",
    this.buildingNumber = "",
    this.floor = "",
    this.apartment = "",
    this.landmark = "",
    this.city = "",
    this.state = "",
    this.postalCode = "",
    this.country = "",
    this.notes = "",
    this.isDefault = true,
    this.fullAddress = "",
  });
}
