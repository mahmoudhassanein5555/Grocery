import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_manager.dart';
import '../../../../core/di/servicelocator.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/personal_details_repo.dart';
import '../models/profile_model.dart';
import '../../../../../core/api/api_endpoints.dart';
import '../../../login/data/local/local_data_source.dart';

class PersonalDetailsRepoImpl implements PersonalDetailsRepo {
  final ApiManager apiManger;
  final LocalauthDatasouce _localAuthDataSource = getIt<LocalauthDatasouce>();

  PersonalDetailsRepoImpl({required this.apiManger});

  Future<Map<String, dynamic>> _authHeaders() async {
    final token = await _localAuthDataSource.getToken();
    if (token == null || token.isEmpty) {
      throw Exception('Authentication token not found');
    }
    return {'Authorization': 'Bearer $token'};
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile() async {
    try {
      final response = await apiManger.getData(
        endPoint: ApiEndpoints.getProfile,
        headers: await _authHeaders(),
      );
      print('✅ response: ${response.data}');
      return Right(ProfileModel.fromJson(response.data));
    } catch (e) {
      print('❌ error: $e');
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(ProfileEntity profile) async {
    try {
      await apiManger.putData(
        endPoint: ApiEndpoints.updateProfile,
        headers: await _authHeaders(),
        body: ProfileModel(
          username: profile.username,
          firstname: profile.firstname,
          lastname: profile.lastname,
          email: profile.email,
          phone: profile.phone,
          countryCode: profile.countryCode,
          preferredLanguage: profile.preferredLanguage,
        ).toJson(),
      );
      return const Right(null);
    } catch (e) {
      if (e is DioException) {
        print('❌ update error: ${e.response?.data}');
      }
      return Left(Failure(e.toString()));
    }
  }
}
