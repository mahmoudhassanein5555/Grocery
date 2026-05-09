import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/delivery_addresses_repo.dart';
import 'delivery_addresses_state.dart';

class DeliveryAddressesCubit extends Cubit<DeliveryAddressesState> {
  final DeliveryAddressesRepo repo;

  DeliveryAddressesCubit({required this.repo})
      : super(DeliveryAddressesInitial());

  Future<void> getAddresses() async {
    if (isClosed) return;
    emit(DeliveryAddressesLoading());
    final result = await repo.getAddresses();
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed)
          emit(DeliveryAddressesError(message: failure.failuremessage));
      },
      (addresses) {
        if (!isClosed) emit(DeliveryAddressesLoaded(addresses: addresses));
      },
    );
  }

  Future<void> storeAddress(AddressEntity address) async {
    if (isClosed) return;
    emit(DeliveryAddressesStoreLoading());
    final result = await repo.storeAddress(address);
    if (isClosed) return;
    result.fold(
      (failure) {
        if (!isClosed)
          emit(DeliveryAddressesError(message: failure.failuremessage));
      },
      (_) async {
        if (!isClosed) {
          emit(DeliveryAddressesStoreSuccess());
          await getAddresses();
        }
      },
    );
  }
}
