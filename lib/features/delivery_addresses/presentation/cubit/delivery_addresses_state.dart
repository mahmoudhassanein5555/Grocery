import '../../domain/entities/address_entity.dart';

abstract class DeliveryAddressesState {}

class DeliveryAddressesInitial extends DeliveryAddressesState {}

class DeliveryAddressesLoading extends DeliveryAddressesState {}

class DeliveryAddressesLoaded extends DeliveryAddressesState {
  final List<AddressEntity> addresses;
  DeliveryAddressesLoaded({required this.addresses});
}

class DeliveryAddressesStoreLoading extends DeliveryAddressesState {}

class DeliveryAddressesStoreSuccess extends DeliveryAddressesState {}

class DeliveryAddressesError extends DeliveryAddressesState {
  final String message;
  DeliveryAddressesError({required this.message});
}
