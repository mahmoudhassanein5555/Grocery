import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import 'entities/address_entity.dart';

abstract class DeliveryAddressesRepo {
  Future<Either<Failure, List<AddressEntity>>> getAddresses();
  Future<Either<Failure, AddressEntity>> storeAddress(AddressEntity address);
}
