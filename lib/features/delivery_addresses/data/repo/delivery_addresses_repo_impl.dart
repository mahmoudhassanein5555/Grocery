import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocery1/features/delivery_addresses/data/mappers/addressmappers.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/di/servicelocator.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/delivery_addresses_repo.dart';
import '../models/address_model.dart';
import '../../../../../core/api/api_endpoints.dart';
import '../../../login/data/local/local_data_source.dart';

class DeliveryAddressesRepoImpl implements DeliveryAddressesRepo {
  final ApiManager apiManger;
  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  DeliveryAddressesRepoImpl({required this.apiManger});

  // Future<void> saveAddressId(String id) async {
  //   await secureStorage.write(key: 'address_id', value: id);
  // }

  // Future<String?> getAddressId() async {
  //   return await secureStorage.read(key: 'address_id');
  // }

  Future<Map<String, dynamic>> _authHeaders() async {
    final token = await _localAuthDataSource.getToken();
    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }
    return {'Authorization': 'Bearer $token'};
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddresses() async {
    try {
      final response = await apiManger.getData(
        endPoint: ApiEndpoints.getAddresses,
        headers: await _authHeaders(),
      );
      print('✅ addresses: ${response.data}');
      final List data = response.data['data'];
      return Right(data.map((e) => AddressModel.fromJson(e).toEntity()).toList());
    } catch (e) {
      print('❌ error: $e');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressEntity>> storeAddress(
      AddressEntity address) async {
    try {
      final response = await apiManger.postData(
        endPoint: ApiEndpoints.storeAddress,
        headers: await _authHeaders(),
        body: AddressModel(
          fullName: address.fullName,
          phone: address.phone,
          streetAddress: address.streetAddress,
          city: address.city,
          country: address.country,
          isDefault: address.isDefault,
        ).toJson(),
      );
      return Right(AddressModel.fromJson(response.data['data']).toEntity());
    } catch (e) {
      if (e is DioException) {
        print('❌ store error details: ${e.response?.data}');
      }
      return Left(Failure(e.toString()));
    }
  }
}
